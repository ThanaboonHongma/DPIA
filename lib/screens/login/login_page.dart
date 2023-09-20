import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 29, right: 29, top: 44, bottom: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/LoginPage/logo.png",
                    width: 200,
                    height: 85,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "ยินดีต้อนรับสู่ DPIA Lite",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "เครื่องมือเพื่อประเมินว่าองค์กรมีการประมวลผลข้อมูล\nที่มีความเสี่ยงสูง",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  const SizedBox(
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                'เข้าสู่ระบบ',
                                style:
                                    Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.44),
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ..._buildTextFields(),
                          const SizedBox(height: 32),
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
    );
  }

  _buildTextFields() {
    return [
      Row(
        children: [
          Text(
            "ชื่อผู้ใช้",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
          controller: _usernameController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ชื่อบริษัท",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
          controller: _companynameController,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "เบอร์โทรศัพท์",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
          controller: _telController,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "อีเมล",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
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
            backgroundColor: const Color(0xff23A9E1), // Background color
          ),
          onPressed: () {
            context.go('/HomePage');
            // Navigator.pushReplacement(
            // context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: Text(
            "เข้าสู่ระบบ",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    ];
  }

  // void _handleClickLogin() {
  //   print(
  //       "Login : with ${_usernameController.text}, ${_companynameController.text}, ${_telController.text}, ${_emailController.text})");
  // }
}
