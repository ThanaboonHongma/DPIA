import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpia_project/models/login/loginmodel.dart';
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
                          width: 232,
                          height: 85,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "ยินดีต้อนรับสู่ DPIA Lite",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
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
              height: 40,
              child: TextFormField(
                onSaved: (String? username) {
                  modelDPIA.username = username!;
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
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
            SizedBox(
              height: 40,
              child: TextFormField(
                onSaved: (String? company) {
                  modelDPIA.company = company!;
                },
                decoration: const InputDecoration(
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
            SizedBox(
              height: 40,
              child: TextFormField(
                inputFormatters: [MaskTextInputFormatter(mask: "###-###-####")],
                keyboardType: TextInputType.phone,
                onSaved: (String? phone) {
                  modelDPIA.phonenumber = phone!;
                },
                decoration: const InputDecoration(
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
            SizedBox(
              height: 40,
              child: TextFormField(
                onSaved: (String? email) {
                  modelDPIA.email = email!;
                },
                decoration: const InputDecoration(
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
          ],
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
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();
              // print(modelDPIA.username);
              var datedpia = {
                'User': modelDPIA.username,
                'company': modelDPIA.company,
                'phone': modelDPIA.phonenumber,
                'email': modelDPIA.email,
              };
              await childCollectionRef.add(datedpia);
              context.go('/HomePage');
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
