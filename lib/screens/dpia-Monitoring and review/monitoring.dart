import 'package:dpia_project/models/monitoring/monitoring.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:dpia_project/utilities/responsive.dart';
import 'package:dpia_project/utilities/savedata.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({super.key});

  @override
  State<MonitoringPage> createState() => _MonitoringPage();
}

class _MonitoringPage extends State<MonitoringPage> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  bool isButtonPressed = false;

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'แบบฟอร์มประเมิน DPIA',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ],
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          onTap: () {
            context.go('/MitigatingMeasuresPage');
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              color: const Color(0xffDEDEDE),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: Responsive.isMobile(context)
                    ? 540
                    : Responsive.isTablet(context)
                        ? 980
                        : 1480,
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'ขั้นตอนที่ 7 MonitoringPage and review',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'การติดตามตรวจสอบและทบทวนตาม DPIA ฉบับนี้',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: Responsive.isMobile(context)
                  ? 540
                  : Responsive.isTablet(context)
                      ? 980
                      : 1480,
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
                      Text(
                        'ให้ติดตามตรวจสอบโดย',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('DPO หรือหน่วยงาน'),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: textController1,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          'ผู้รับผิดชอบโครงการหรือการประมวลผลข้อมูลตาม DPIA นี้มีหน้าที่รายงาน DPO หรือหน่วยงาน'),
                      const SizedBox(
                        height: 10,
                      ),
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
                      Text(
                        'การเผยแพร่เอกสาร DPIA ฉบับนี้',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: textController3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Text('โดยปกติปิดเฉพาะข้อมูล'),
                      const SizedBox(
                        height: 10,
                      ),
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
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    final dpiaProvider = Provider.of<DpiaProvider>(context, listen: false);

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  if (dpiaProvider.riskAssessments.isEmpty) {
                    context.go('/RiskAssessmentPage');
                  } else {
                    context.go('/MitigatingMeasuresPage');
                  }
                },
                child: const Text('ย้อนกลับ')),
          ),
          const Text(
            '7 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                  onPressed: isButtonPressed
                      ? null
                      : () async {
                          setState(() {
                            isButtonPressed = true;
                          });
                          dpiaProvider.saveMonitoring(Monitoring(
                              id: const Uuid().v4(),
                              agency: textController1.text,
                              responsible: textController2.text,
                              publish: textController3.text,
                              closedata: textController4.text));
                          savedata(context);
                          context.go('/CompletePage');
                          Provider.of<DpiaProvider>(context, listen: false)
                              .reset();
                          Provider.of<DpiaProvider>(context, listen: false)
                              .setupData();
                        },
                  child: const Text('สิ้นสุดแบบประเมิน'))),
        ],
      ),
    );
  }
}
