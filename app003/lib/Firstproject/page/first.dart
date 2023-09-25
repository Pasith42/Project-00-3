import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

final formatter = DateFormat.yMMMMEEEEd();

enum Gender { man, girl }

enum Status { single, marry, divorce }

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
  Status? _status = Status.single;
  final int _numberboy = 0;
  final int _numbergirl = 0;

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

  //แก้ปัญหาอยู่
  Widget numberinputspinner(int number) {
    return Container(
      width: 60.0,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.blueGrey,
          width: 2.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              '$number',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 38.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          number += 1; // incrementing value
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_up,
                        size: 18.0,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (number > 0) {
                          number -= 1;
                        } else {
                          number = 0;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 18.0,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue:
              _currentStep < 3 ? () => setState(() => _currentStep += 1) : null,
          onStepCancel:
              _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          steps: [
            Step(
              title: const Text(
                'หน้า 1',
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'สมัครสมาชิก',
                      textAlign: TextAlign.left,
                      textScaleFactor: 3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Hope Application',
                      textAlign: TextAlign.left,
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      height: 250,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 220,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'ตั้งชื่อเข้าระบบ(username)'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('อีเมล(Email)'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'กำหนดรหัสผ่านเข้าระบบ(Password)'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลเข้าระบบ',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      height: 380,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        DropdownButtonFormField(
                                          value: _firstname,
                                          items: <String>['นาย', 'นาง']
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('ชื่อ'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('นามสกุล'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            label:
                                                const Text('เลขที่บัตรประชาชน'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              _selectedDate == null
                                                  ? 'ไม่มีข้อมูลที่เลือกวันที่'
                                                  : formatter
                                                      .formatInBuddhistCalendarThai(
                                                          _selectedDate!),
                                            ),
                                            IconButton(
                                              onPressed: _presentDatePicker,
                                              icon: const Icon(
                                                  Icons.calendar_month),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลส่วนบุคคล',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              state: _currentStep == 0 ? StepState.editing : StepState.complete,
              isActive: _currentStep == 0,
            ),
            Step(
              title: const Text(
                'หน้าสอง',
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 300,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'สถานะภาพ',
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Radio<Status>(
                                              value: Status.single,
                                              groupValue: _status,
                                              onChanged: (Status? value) {
                                                setState(() {
                                                  _status = value;
                                                });
                                              },
                                            ),
                                            const Text('โสด'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Radio<Status>(
                                              value: Status.marry,
                                              groupValue: _status,
                                              onChanged: (Status? value) {
                                                setState(() {
                                                  _status = value;
                                                });
                                              },
                                            ),
                                            const Text(
                                              'แต่งงานแล้ว',
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Radio<Status>(
                                              value: Status.divorce,
                                              groupValue: _status,
                                              onChanged: (Status? value) {
                                                setState(() {
                                                  _status = value;
                                                });
                                              },
                                            ),
                                            const Text(
                                              'หย่าร้างแล้ว',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'จำนวนบุตรชาย',
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                numberinputspinner(_numberboy),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 60,
                                            ),
                                            Column(
                                              children: [
                                                const Text(
                                                  'จำนวนบุตรหญิง',
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                numberinputspinner(_numbergirl),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          maxLength: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('พิมพ์ชื่อเล่น'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.trim().length <= 1 ||
                                                value.trim().length > 20) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 20 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลส่วนบุคคล',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      height: 310,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 280,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'เบอร์โทรติดต่อ',
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'ขอกรุณาพิมพ์เบอร์โทรเข้า';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          maxLength: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('ไลน์ไอดี'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.trim().length <= 1 ||
                                                value.trim().length > 20) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 20 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          maxLength: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('เฟสบุ๊ค'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.trim().length <= 1 ||
                                                value.trim().length > 50) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 50 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลการติดต่อ',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 300,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label:
                                                const Text('ที่อยู่บ้านเลขที่'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty
                                                //||
                                                //value.trim().length <= 1 ||
                                                //value.trim().length > 50
                                                ) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 50 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('เลือกจังหวัด'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty
                                                //||
                                                //value.trim().length <= 1 ||
                                                //value.trim().length > 50
                                                ) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 50 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('เลือกตำบล/แขวง'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty
                                                //||
                                                //value.trim().length <= 1 ||
                                                //value.trim().length > 50
                                                ) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 50 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('เลือกอำเภอ/เขต'),
                                            contentPadding:
                                                const EdgeInsets.all(8.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty
                                                //||
                                                //value.trim().length <= 1 ||
                                                //value.trim().length > 50
                                                ) {
                                              return 'ขอกรุณาพิมพ์มากกว่า 1 คำ และไม่เกิน 50 คำ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            () {};
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลที่อยู่',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              state: _currentStep == 1 ? StepState.editing : StepState.complete,
              isActive: _currentStep == 1,
            ),
            Step(
              title: const Text(
                'หน้าสาม',
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 300,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลการติดต่อ',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 300,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลที่อยู่',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              state: _currentStep == 2 ? StepState.editing : StepState.complete,
              isActive: _currentStep == 2,
            ),
            Step(
              title: const Text(
                'หน้าสี่',
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400,
                      height: 300,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 270,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 15,
                              child: Container(
                                height: 30,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'ข้อมูลการติดต่อ',
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              state: _currentStep == 3 ? StepState.editing : StepState.complete,
              isActive: _currentStep == 3,
            ),
          ],
        ),
      ),
    );
  }
}
