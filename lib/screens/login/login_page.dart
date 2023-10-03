import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpia_project/models/login/loginmodel.dart';
import 'package:dpia_project/utilities/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AutovalidateMode _autovalidateMode = AutovalidateMode.onUserInteraction;
  final formKey = GlobalKey<FormState>();
  

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference _dpiaCollection =
      FirebaseFirestore.instance.collection('DPIA_Project');

  late DocumentReference<Object?> documentRef =
      _dpiaCollection.doc('DPIA_Document');

  late CollectionReference<Map<String, dynamic>> childCollectionRef =
      documentRef.collection('DPIA_User');

  late CollectionReference<Map<String, dynamic>> childCollectionRefuser =
      documentRef.collection('DPIA_assessment');

  LoginModel modelDPIA = LoginModel(
    username: '',
    company: '',
    phonenumber: '',
    email: '',
  );

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> signInAsGuest() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      // The user is signed in as a guest
      // print('Signed in as a guest');
    } catch (e) {
      // Handle any errors that occur during guest sign-in
      // print('Error signing in as a guest: $e');
    }
  }

  void getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.go('/HomePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.grey.shade100,
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
                        Image.asset(
                          "assets/dpo_online.png",
                          width: 300,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "ยินดีต้อนรับสู่ DPIA Lite",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "เครื่องมือเพื่อประเมินว่าองค์กรมีการประมวลผลข้อมูล\nที่มีความเสี่ยงสูง",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Responsive.isMobile(context)
                              ? 460
                              : Responsive.isTablet(context)
                                  ? 900
                                  : 1400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.44),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 8),
                              ),
                            ],
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
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
                                ..._buildTextFormFields(),
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
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  _buildTextFormFields() {
    return [
      Form(
        key: formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "ชื่อผู้ใช้",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: TextFormField(
                onSaved: (String? username) {
                  modelDPIA.username = username!;
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0),
                  hintText: 'กรอกชื่อผู้ใช้',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              onSaved: (String? company) {
                modelDPIA.company = company!;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0),
                hintText: 'กรอกชื่อบริษัท',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              inputFormatters: [MaskTextInputFormatter(mask: "###-###-####")],
              keyboardType: TextInputType.phone,
              onSaved: (String? phone) {
                modelDPIA.phonenumber = phone!;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0),
                hintText: 'กรอกเบอร์โทรศัพท์',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              onSaved: (String? email) {
                modelDPIA.email = email!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกอีเมล';
                }
                if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                    .hasMatch(value)) {
                  return 'รูปแบบอีเมลไม่ถูกต้อง';
                }
                return null;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0),
                hintText: 'กรอกอีเมล',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  _buildButtons() {
    return [
      SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff23A9E1), // Background color
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();
              await signInAsGuest().then((value) => context.go('/HomePage'));
            }
          },
          child: Text(
            "เข้าสู่ระบบ",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    ];
  }
}
