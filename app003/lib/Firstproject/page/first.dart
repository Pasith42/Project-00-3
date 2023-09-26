import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';
import 'package:app003/Firstproject/utils.dart';

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
  //คำนำหน้าชื่อ
  List<String> prefixs = ['นาย', 'นาง'];
  String? _prefix;
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
  //สังกัดคริสตจักร
  List<String> selectChurchs = ['1', '2', '3', '4'];
  String? _selectChurch;
  //สังกัดส่วน
  List<String> selectDivisions = ['1', '2', '3', '4'];
  String? _selectDivision;
  //สังกัดเขต
  List<String> selectCountys = ['1', '2', '3', '4'];
  String? _selectCounty;
  //สังกัดแขวง
  List<String> selectSubdistrics = ['1', '2', '3', '4'];
  String? _selectSubdistrics;
  //สังกัดหน่วย
  List<String> selectUnits = ['1', '2', '3', '4'];
  String? _selectUnit;
//สังกัดแคร์
  List<String> selectCares = ['1', '2', '3', '4'];
  String? _selectCare;
//สังกัดฝ่ายวิญญาณ
  List<String> selectSpiritStates = ['1', '2', '3', '4'];
  String? _selectSpiritState;
  //เพศ
  Gender? _gender = Gender.man;
  DateTime? _selectedDate;
  //สถานะ
  Status? _status = Status.single;
  Education? _education = Education.graduation;
  //จำนวนบุตร
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

  void _incrementnumberboy() {
    setState(() {
      _numberboy++;
    });
  }

  void _decrementnumberboy() {
    if (_numberboy > 0) {
      setState(() {
        _numberboy--;
      });
    } else {
      setState(() {
        _numberboy = 0;
      });
    }
  }

  void _incrementnumbergirl() {
    setState(() {
      _numbergirl++;
    });
  }

  void _decrementnumbergirl() {
    if (_numbergirl > 0) {
      setState(() {
        _numbergirl--;
      });
    } else {
      setState(() {
        _numbergirl = 0;
      });
    }
  }

  Widget topicName(String name, double widths, double fem, double ffem) {
    return Positioned(
      top: 0 * fem,
      left: 15 * fem,
      child: Container(
        height: 30 * fem,
        width: widths,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: safeGoogleFont(
              'Sarabun',
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.3 * ffem / fem,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget dropdown(
      String name, String? value1, List<String> list, double fem, double ffem) {
    return Padding(
      padding: EdgeInsets.all(3.0 * fem),
      child: Container(
        padding: EdgeInsets.only(left: 10 * fem, right: 10 * fem),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1 * fem),
          borderRadius: BorderRadius.circular(20 * fem),
        ),
        child: DropdownButtonFormField(
          hint: Text(name),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 20 * fem,
          style: safeGoogleFont(
            'Sarabun',
            fontSize: 15 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.3 * ffem / fem,
            color: Colors.black,
          ),
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

  Widget textSafeGoogleFont(
      String name, double size, Color colors, double fem, double ffem) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: safeGoogleFont(
        'Sarabun',
        fontSize: size * ffem,
        fontWeight: FontWeight.w400,
        height: 1.3 * ffem / fem,
        color: colors,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 411.43;
    var wd = MediaQuery.of(context).size.width;
    var w = wd.toStringAsFixed(2);
    var fem = MediaQuery.of(context).size.width / baseWidth;
    var ffem = fem * 0.97;

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
              title:
                  textSafeGoogleFont('หน้าหนึ่ง', 12, Colors.black, fem, ffem),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'สมัครสมาชิก',
                          textAlign: TextAlign.left,
                          style: safeGoogleFont(
                            'Sarabun',
                            fontSize: 30 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3 * ffem / fem,
                            letterSpacing: 0.64 * fem,
                            color: const Color(0xff5b585b),
                          ),
                        ),
                        Text(
                          'Hope Application',
                          textAlign: TextAlign.left,
                          style: safeGoogleFont(
                            'Sarabun',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3 * ffem / fem,
                            letterSpacing: 0.44 * fem,
                            color: const Color(0xff5b585b),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    SizedBox(
                      width: 400 * fem,
                      height: 250 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 220 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'ตั้งชื่อเข้าระบบ(username)',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(10.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'อีเมล(Email)',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'กำหนดรหัสผ่านเข้าระบบ(Password)',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName('ข้อมูลเข้าระบบ', 130, fem, ffem),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    SizedBox(
                      width: 400 * fem,
                      height: 420 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 390 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        dropdown('เลือกคำนำหน้าชื่อ', _prefix,
                                            prefixs, fem, ffem),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont('ชื่อ',
                                                16, Colors.black54, fem, ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont('นามสกุล',
                                                16, Colors.black54, fem, ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'เลขที่บัตรประชาชน',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
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
                                            textSafeGoogleFont('เพศชาย', 14,
                                                Colors.black87, fem, ffem),
                                            SizedBox(
                                              width: 20 * fem,
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
                                            textSafeGoogleFont('เพศหญิง', 14,
                                                Colors.black87, fem, ffem),
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
                                              textAlign: TextAlign.center,
                                              style: safeGoogleFont(
                                                'Sarabun',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3 * ffem / fem,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName('ข้อมูลส่วนบุคคล', 130, fem, ffem),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Width : $w',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
              state: _currentStep == 0 ? StepState.editing : StepState.complete,
              isActive: _currentStep == 0,
            ),
            Step(
              title: textSafeGoogleFont('หน้าสอง', 12, Colors.black, fem, ffem),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400 * fem,
                      height: 300 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 270 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        textSafeGoogleFont('สถานะภาพ', 14,
                                            Colors.black87, fem, ffem),
                                        SizedBox(
                                          height: 5 * fem,
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
                                            textSafeGoogleFont('โสด', 14,
                                                Colors.black87, fem, ffem),
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
                                            textSafeGoogleFont('สมรส', 14,
                                                Colors.black87, fem, ffem),
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
                                            textSafeGoogleFont('หย่าร้าง', 14,
                                                Colors.black87, fem, ffem),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 40 * fem,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                textSafeGoogleFont(
                                                    'จำนวนบุตรชาย',
                                                    14,
                                                    Colors.black87,
                                                    fem,
                                                    ffem),
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                Container(
                                                  width: 60.0,
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
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
                                                          '$_numberboy',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 38.0,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                border: Border(
                                                                  bottom:
                                                                      BorderSide(
                                                                    width: 0.5,
                                                                  ),
                                                                ),
                                                              ),
                                                              child: InkWell(
                                                                onTap:
                                                                    _incrementnumberboy,
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .arrow_drop_up,
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap:
                                                                  _decrementnumberboy,
                                                              child: const Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 60 * fem,
                                            ),
                                            Column(
                                              children: [
                                                textSafeGoogleFont(
                                                    'จำนวนบุตรหญิง',
                                                    14,
                                                    Colors.black87,
                                                    fem,
                                                    ffem),
                                                SizedBox(
                                                  height: 10 * fem,
                                                ),
                                                Container(
                                                  width: 60.0,
                                                  foregroundDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
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
                                                          '$_numbergirl',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 38.0,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                border: Border(
                                                                  bottom:
                                                                      BorderSide(
                                                                    width: 0.5,
                                                                  ),
                                                                ),
                                                              ),
                                                              child: InkWell(
                                                                onTap:
                                                                    _incrementnumbergirl,
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .arrow_drop_up,
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap:
                                                                  _decrementnumbergirl,
                                                              child: const Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          maxLength: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'พิมพ์ชื่อเล่น',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                            topicName('ข้อมูลส่วนบุคคล', 130, fem, ffem),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    SizedBox(
                      width: 400 * fem,
                      height: 310 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 280 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'เบอร์โทรที่ติดต่อ',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 20 * fem,
                                        ),
                                        TextFormField(
                                          maxLength: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'ไลน์ไอดี',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 20 * fem,
                                        ),
                                        TextFormField(
                                          maxLength: 20,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont('เฟสบุ๊ค',
                                                16, Colors.black54, fem, ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                            topicName('ข้อมูลการติดต่อ', 130, fem, ffem),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 400 * fem,
                      height: 300 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 270 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'ที่อยู่บ้านเลขที่',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'เลือกจังหวัด',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'เลือกตำบล/แขวง',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'เลือกอำเภอ/เขต',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                            topicName('ข้อมูลที่อยู่', 100, fem, ffem),
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
              title: textSafeGoogleFont('หน้าสาม', 12, Colors.black, fem, ffem),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400 * fem,
                      height: 300 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 270 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
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
                                            textSafeGoogleFont(
                                                'สำเร็จการศึกษาแล้ว',
                                                14,
                                                Colors.black87,
                                                fem,
                                                ffem),
                                            SizedBox(
                                              width: 10 * fem,
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
                                            textSafeGoogleFont('กำลังศึกษา', 14,
                                                Colors.black87, fem, ffem),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกระดับการศึกษาสูงสุด',
                                            _topedution,
                                            topEducation,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'ชื่อสถาบันการศึกษา',
                                                14,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'คณะ/ภาควิชา/แผนกวิชา',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                            topicName('ข้อมูลการศึกษา', 130, fem, ffem),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    SizedBox(
                      width: 400 * fem,
                      height: 430 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 400 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'ประกอบอาชีพ',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'จังหวัดหรือพื้นที่เขตที่ทำงานอยู่ปัจจุบัน',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกประเภทหัวข้อความสามารถพิเศษ',
                                            _talent,
                                            talentes,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        TextFormField(
                                          //maxLength: 50,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            label: textSafeGoogleFont(
                                                'รายละเอียดของความสามารถพิเศษ',
                                                16,
                                                Colors.black54,
                                                fem,
                                                ffem),
                                            contentPadding:
                                                EdgeInsets.all(8.0 * fem),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0 * fem),
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
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกประเภทหัวข้อที่สนใจพิเศษ',
                                            _selectTopicInterest,
                                            selectTopicInterests,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกประเภทหัวข้องานอาสาที่สนใจ',
                                            _selectVolunteeWork,
                                            selectVolunteeWorks,
                                            fem,
                                            ffem)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName('ข้อมูลอาชีพและความถนัด', 210, fem, ffem),
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
              title: textSafeGoogleFont('หน้าสี่', 12, Colors.black, fem, ffem),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 400 * fem,
                      height: 510 * fem,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 400 * fem,
                                height: 480 * fem,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3 * fem,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0 * fem),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดคริสตจักรสถานนมัสการ',
                                            _selectChurch,
                                            selectChurchs,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดส่วน',
                                            _selectDivision,
                                            selectDivisions,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดส่วนเขต',
                                            _selectCounty,
                                            selectCountys,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดแขวง',
                                            _selectSubdistrics,
                                            selectSubdistrics,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกสังกัดหน่วย',
                                            _selectUnit,
                                            selectUnits,
                                            fem,
                                            ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown('เลือกสังกัดแคร์', _selectCare,
                                            selectCares, fem, ffem),
                                        SizedBox(
                                          height: 5 * fem,
                                        ),
                                        dropdown(
                                            'เลือกสถานะภาพฝ่ายวิญญาณ',
                                            _selectSpiritState,
                                            selectSpiritStates,
                                            fem,
                                            ffem),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            topicName(
                                'สังกัดและสถานะภาพฝ่ายวิญญาณ', 290, fem, ffem)
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
