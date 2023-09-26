import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

final formatter = DateFormat.yMMMMEEEEd();

enum Gender { man, girl }

enum Status { single, marry, divorce }

enum Education { graduation, studying }

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  int _currentStep = 0;
  //ชื่อ
  List<String> firstName = ['นาย', 'นาง'];
  String? _firstname;
//การศึกษาสูงสุด
  List<String> topEducation = [
    'ไม่มีการศึกษา',
    'ประถมศึกษา',
    'มัธยมศึกษา',
    'อาชีวศึกษา',
    'ระดับปริญญาตรีหรือเทียบเท่าขึ้นไป',
    'ระดับประกาศนียบัตรที่สูงกว่าปริญญาตรี'
  ];
  String? _topedution;
//ความสามารถพิเศษ
  List<String> talentes = [
    'ดนตรี',
    'กีฬา',
    'เทคโนโลยี',
    'เก่งคำนวณ',
    'การศึกษา',
    'อื่น',
    'ไม่มี'
  ];
  String? _talent;
//หัวข้อที่สนใจพิเศษ
  List<String> selectTopicInterests = [
    'นมัสการ',
    'อธิษฐาน',
    'รักษาโรค',
    'ความเชื่อ',
    'ความหวัง'
  ];
  String? _selectTopicInterest;
//งานอาสา
  List<String> selectVolunteeWorks = [
    'ปลูกต้นไม้',
    'เก็บแยกขยะ',
    'บ้านเด็กกำพร้า',
    'ทาสีโรงเรียน'
  ];
  String? _selectVolunteeWork;

  List<String> selectChurchs = ['1', '2', '3', '4'];
  String? _selectChurch;

  List<String> selectDivisions = ['1', '2', '3', '4'];
  String? _selectDivision;

  List<String> selectCountys = ['1', '2', '3', '4'];
  String? _selectCounty;

  List<String> selectSubdistrics = ['1', '2', '3', '4'];
  String? _selectSubdistrics;

  List<String> selectUnits = ['1', '2', '3', '4'];
  String? _selectUnit;

  List<String> selectCares = ['1', '2', '3', '4'];
  String? _selectCare;

  List<String> selectSpiritStates = ['1', '2', '3', '4'];
  String? _selectSpiritState;

  Gender? _gender = Gender.man;
  DateTime? _selectedDate;
  Status? _status = Status.single;
  Education? _education = Education.graduation;
  int _numberboy = 0;
  int _numbergirl = 0;

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
              number.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
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
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_drop_up,
                      size: 18.0,
                    ),
                    onTap: () {
                      int currentValue = number;
                      setState(() {
                        currentValue++;
                        number = currentValue; // incrementing value
                        print(number);
                      });
                    },
                  ),
                ),
                InkWell(
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 18.0,
                  ),
                  onTap: () {
                    int currentValue = number;
                    setState(() {
                      print("Setting state");
                      currentValue--;
                      number = (currentValue > 0
                          ? currentValue
                          : 0); // decrementing value
                      print(number);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topicName(String name, double widths) {
    return Positioned(
      top: 0,
      left: 15,
      child: Container(
        height: 30,
        width: widths,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.left,
            textScaleFactor: 1.3,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget dropdown(String name, String? value1, List<String> list) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: DropdownButtonFormField(
          hint: Text(name),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 20,
          style: const TextStyle(color: Colors.black, fontSize: 15),
          value: value1,
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              value1 = value!;
            });
          },
        ),
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'ตั้งชื่อเข้าระบบ(username)'),
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
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
                                        const SizedBox(
                                          height: 10,
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
                            topicName('ข้อมูลเข้าระบบ', 130),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 400,
                      height: 420,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 390,
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
                                        dropdown('เลือกคำนำหน้าชื่อ',
                                            _firstname, firstName),
                                        const SizedBox(
                                          height: 10,
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
                                        const SizedBox(
                                          height: 10,
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
                                        const SizedBox(
                                          height: 10,
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
                                        const SizedBox(
                                          height: 10,
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
                                            IconButton(
                                              onPressed: _presentDatePicker,
                                              icon: const Icon(
                                                  Icons.calendar_month),
                                            ),
                                            Text(
                                              _selectedDate == null
                                                  ? 'ไม่มีข้อมูลที่เลือกวันที่'
                                                  : formatter
                                                      .formatInBuddhistCalendarThai(
                                                          _selectedDate!),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName('ข้อมูลส่วนบุคคล', 130),
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
                                    padding: const EdgeInsets.all(20.0),
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
                                              width: 5,
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
                                              width: 5,
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
                                              'หย่าร้าง',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
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
                            topicName('ข้อมูลส่วนบุคคล', 130),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                            topicName('ข้อมูลการติดต่อ', 130),
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
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
                            topicName('ข้อมูลที่อยู่', 100),
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
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Radio<Education>(
                                              value: Education.graduation,
                                              groupValue: _education,
                                              onChanged: (Education? value) {
                                                setState(() {
                                                  _education = value;
                                                });
                                              },
                                            ),
                                            const Text('สำเร็จการศึกษา'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Radio<Education>(
                                              value: Education.studying,
                                              groupValue: _education,
                                              onChanged: (Education? value) {
                                                setState(() {
                                                  _education = value;
                                                });
                                              },
                                            ),
                                            const Text(
                                              'กำลังการศึกษา',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown('เลือกระดับการศึกษาสูงสุด',
                                            _topedution, topEducation),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'ชื่อสถาบันการศึกษา'),
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
                                          height: 5,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'คณะ/ภาควิชา/แผนกวิชา'),
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
                            topicName('ข้อมูลการศึกษา', 130),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 400,
                      height: 430,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 400,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text('ประกอบอาชีพ'),
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
                                          height: 5,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'จังหวัดหรือพื้นที่เขตที่ทำงานอยู่ปัจจุบัน'),
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
                                          height: 5,
                                        ),
                                        dropdown(
                                            'เลือกประเภทหัวข้อความสามารถพิเศษ',
                                            _talent,
                                            talentes),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: const Text(
                                                'รายละเอียดของความสามารถพิเศษ'),
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
                                          height: 5,
                                        ),
                                        dropdown(
                                            'เลือกประเภทหัวข้อที่สนใจพิเศษ',
                                            _selectTopicInterest,
                                            selectTopicInterests),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown(
                                            'เลือกประเภทหัวข้องานอาสาที่สนใจ',
                                            _selectVolunteeWork,
                                            selectVolunteeWorks)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName(
                              'ข้อมูลอาชีพและความถนัด',
                              210,
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
                      height: 510,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400,
                                height: 480,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดคริสตจักรสถานนมัสการ',
                                            _selectChurch,
                                            selectChurchs),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown('เลือกสังกัดส่วน',
                                            _selectDivision, selectDivisions),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown('เลือกสังกัดส่วนเขต',
                                            _selectCounty, selectCountys),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดแขวง',
                                            _selectSubdistrics,
                                            selectSubdistrics),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown('เลือกสังกัดหน่วย',
                                            _selectUnit, selectUnits),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown('เลือกสังกัดแคร์', _selectCare,
                                            selectCares),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        dropdown(
                                            'เลือกสถานะภาพฝ่ายวิญญาณ',
                                            _selectSpiritState,
                                            selectSpiritStates),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName('สังกัดและสถานะภาพฝ่ายวิญญาณ', 290)
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
