import 'package:flutter/material.dart';

class monitoring extends StatefulWidget {
  const monitoring({super.key});

  @override
  State<monitoring> createState() => _monitoring();
}

class _monitoring extends State<monitoring> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'แบบฟอร์มประเมิน DPIA',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(
                10,
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('ขั้นตอนที่ 7 Monitoring and review',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(35, 169, 225, 1),
                              fontSize: 16)),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('[Monitoring and review]'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('การติดตามตรวจสอบและทบทวนตาม DPIA ฉบับนี้'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(
                10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
                    children: [
                      const Text('ให้ติดตามตรวจสอบโดย',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(35, 169, 225, 1),
                              fontSize: 16)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('DPO หรือหน่วยงาน'),
                      SizedBox(
                        child: TextField(
                          controller: textController1,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Text(
                          'ผู้รับผิดชอบโครงการหรือการประมวลผลข้อมูลตาม DPIA นี้มีหน้าที่รายงาน DPO หรือหน่วยงาน'),
                      SizedBox(
                        child: TextField(
                          controller: textController2,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('การเผยแพร่เอกสาร DPIA ฉบับนี้',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(35, 169, 225, 1),
                              fontSize: 16)),
                      const Divider(
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('ให้เผยแพร่ทาง'),
                      SizedBox(
                        child: TextField(
                          controller: textController3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Text('การติดตามตรวจสอบและทบทวนตาม DPIA ฉบับนี้'),
                      SizedBox(
                        child: TextField(
                          controller: textController4,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ], //children
        ),
      ),
    );
  }
}

