import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

final formatter = DateFormat.yMMMMEEEEd();

enum Gender { man, girl }

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  int _currentStep = 0;
  String _firstname = 'นาย';
  Gender? _gender = Gender.man;
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
        now.year - 1 /*เลือกตัวเลข ย้อนหลังกี่ปีครับ*/, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'สมัครสมาชิก',
              textAlign: TextAlign.left,
              textScaleFactor: 1.0,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Hope Application',
              textAlign: TextAlign.left,
              textScaleFactor: 0.5,
            ),
          ],
        ),
      ),
      body: Center(
        child: Form(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepTapped: (step) => setState(() => _currentStep = step),
            onStepContinue: _currentStep < 1
                ? () => setState(() => _currentStep += 1)
                : null,
            onStepCancel: _currentStep > 0
                ? () => setState(() => _currentStep -= 1)
                : null,
            steps: [
              Step(
                title: const Text(
                  'ข้อมูลเข้าระบบ',
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.0,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('ตั้งชื่อเข้าระบบ(username)'),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('อีเมล(Email)'),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('กำหนดรหัสผ่านเข้าระบบ(Password)'),
                      ),
                    ),
                  ],
                ),
                state:
                    _currentStep == 0 ? StepState.editing : StepState.complete,
                isActive: _currentStep == 0,
              ),
              Step(
                title: const Text(
                  'ข้อมูลส่วนบุคคล',
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.0,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Column(
                  children: [
                    DropdownButtonFormField(
                      value: _firstname,
                      items: <String>['นาย', 'นาง']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _firstname = value!;
                        });
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('ชื่อ'),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('นามสกุล'),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('เลขที่บัตรประชาชน'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<Gender>(
                          value: Gender.man,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text(
                          'เพศชาย',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Radio<Gender>(
                          value: Gender.girl,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text(
                          'เพศหญิง',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'ไม่มีข้อมูลที่เลือกวันที่'
                              : formatter.formatInBuddhistCalendarThai(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ],
                ),
                state:
                    _currentStep == 1 ? StepState.editing : StepState.complete,
                isActive: _currentStep == 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
