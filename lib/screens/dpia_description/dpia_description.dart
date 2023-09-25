import 'package:dpia_project/screens/dpia_description/description_listview.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DpiaDescriptionPage extends StatefulWidget {
  const DpiaDescriptionPage({super.key});

  @override
  State<DpiaDescriptionPage> createState() => _DpiaDescriptionPageState();
}

class _DpiaDescriptionPageState extends State<DpiaDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'แบบฟอร์มประเมิน DPIA ',
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
            context.go('/Identification');
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
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ขั้นตอนที่ 2 DPIA Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Color.fromRGBO(35, 169, 225, 1),
                                  ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                '[DPIA Description]',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                "อธิบายรายละเอียดของกระบวนการประมวลผลข้อมูลส่วนบุคคลอย่างน้อยต้องประกอบด้วย\nสภาพ(nature),ขอบเขต(scope),บริบท(cpntext)และวัตถุประสงค์(purpose)ของการประมวลผล",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const DescriptionListview(),
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
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
                  context.go('/Identification');
                },
                child: const Text('ย้อนกลับ')),
          ),
          const Text(
            '2 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    context.go('/Consultation');
                  },
                  child: const Text('ถัดไป'))),
        ],
      ),
    );
  }
}
