import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit(){
    final isValid = _form.currentState!.validate();

    if(isValid) {
      _form.currentState!.save();

      print(_enteredEmail);
      print(_enteredPassword);
      //ตรวจสอบผลลัพธ์จากกระบวนการทำงานโปรแกรม
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Email Addres'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            //การแก้ไขอัตโนมัติทำให้คุณได้รับแก้ไขตลอดเวลา ขณะที่พิมพ์ข้อความ อาจจะเป็นสิ่งที่รำคาญ
                            textCapitalization: TextCapitalization.none,
                            // เพื่อแน่ใจว่าอีเมลไม่มีตัวพิมพ์ใหญ่ ดังนั้นอักษรตัวแรกไม่เป็นตัวพิมพ์ใหญ่อาจจะเป็นสิ่งที่รำคาญ
                            validator: (value) {
                              if(value == null || value.trim().isEmpty || !value.contains('@')){
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            //ซ่อนข้อความที่กำลังแก้ไขหรือไม่ (เช่น สำหรับรหัสผ่าน)
                            validator: (value) {
                              if(value == null || value.trim().length < 6 ){
                                return 'Password must be at least 6 characters long.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Text(_isLogin ? 'Login' : 'Signup'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = _isLogin ? false : true;
                                //_isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Create an account'
                                : 'I already have an account.'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
