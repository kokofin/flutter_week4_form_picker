import 'package:flutter/material.dart';
import 'color_picker_page.dart';
import 'date_picker_page.dart';
import 'file_picker_page.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fileResult;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Arifin"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute<String>(
                      builder: (_) => const FilePickerPage(
                            name: 'Arifin',
                          )))
                  .then((value) => {
                        debugPrint('Hasil back dari filePickerPage $value'),
                        fileResult = value,
                        setState(() {})
                      }),
              title: const Text('Pilih File'),
              subtitle: Text("File Result = $fileResult"),
            ),
            ListTile(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DatePickerPage())),
                title: const Text('Pilih Tanggal Lahir Anda')),
            ListTile(
                onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute<Color>(
                            builder: (_) => const ColorPickerPage()))
                        .then((value) {
                      color = value ?? Colors.red;
                      setState(() {});
                    }),
                title: const Text('Pilih Warna Favorit Anda')),
            Container(
              width: 200,
              height: 200,
              color: color ?? Colors.red,
            )
          ],
        ),
      ),
    );
  }
}