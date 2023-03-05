
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  // create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        title: const Text('Color Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pick a Color',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: pickerColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: pickerColor.withOpacity(0.5),
                    blurRadius: 10.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: Material(
                          child: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: (Color color) {
                              setState(() {
                                pickerColor = color;
                              });
                            },
                            // ignore: deprecated_member_use
                            showLabel: false, // deprecated
                            // ignore: deprecated_member_use
                            labelTextStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                      ),
                      actions: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentColor = pickerColor;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Pick me'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Select color'),
            ),
            const SizedBox(height: 32.0),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                'You picked ${currentColor.value.toRadixString(16)}',
                style: TextStyle(
                  color: currentColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, pickerColor);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
