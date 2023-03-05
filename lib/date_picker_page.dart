
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Date Picker
class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> with SingleTickerProviderStateMixin {

  DateTime? _selectedDate;


  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Pilih Tanggal Lahir:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(DateTime.now().year + 5),
                  ).then((value) {
                    setState(() {
                      _selectedDate = value;
                      _animationController.reset();
                      _animationController.forward();
                    });
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Pilih Tanggal',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Tanggal Lahir: ${DateFormat('dd-MMM-yyyy').format(_selectedDate ?? DateTime.now())}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
