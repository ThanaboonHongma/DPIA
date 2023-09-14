import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _companynameController = TextEditingController();
  final _telController = TextEditingController();
  final _emailController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _usernameController.text = "";
    _companynameController.text = "";
    _telController.text = "";
    _emailController.text = "";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff3D85AD),
              Color(0xff23A9E1),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 29 , right: 29 ,top: 44 , bottom: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/LoginPage/logo.png" , width: 232, height: 85,),
                    SizedBox(
                      height: 50,
                    ),
                    Text("ยินดีต้อนรับสู่ DPIA Lite" , style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "เครื่องมือเพื่อประเมินว่าองค์กรมีการประมวลผลข้อมูล\nที่มีความเสี่ยงสูง",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.44),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ..._buildTextFields(),
                            SizedBox(height: 32),
                            ..._buildButtons(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTextFields() {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ชื่อผู้ใช้"),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
          controller: _usernameController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        ),
        
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ชื่อบริษัท"),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
      controller: _companynameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
   SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("เบอร์โทรศัพท์"),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
       controller: _telController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("อีเมล"),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
         controller: _emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    ];
  }

  _buildButtons() {
    return [
      SizedBox(
        width: 500,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xff23A9E1), // Background color
          ),
          onPressed: _handleClickLogin,
          child: Text("เข้าสู่ระบบ "),
        ),
      ),
    ];
  }

void _handleClickLogin() {
    print(
        "Login : with ${_usernameController.text}, ${_companynameController.text}, ${_telController.text}, ${_emailController.text})");
  }
}
