import 'package:dpia_project/screens/dpia_description/description_listview.dart';

import 'package:flutter/material.dart';

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
        title: Row(
          children: [
            Text(
              'แบบฟอร์มประเมิน DPIA ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
            const Navigator();
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
                      padding: const EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                'ขั้นตอนที่ 2 DPIA Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                '[DPIA Description]',
                                style: Theme.of(context).textTheme.bodyMedium,
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
                                "อธิบายรายละเอียดของกระบวนการประมวลผลข้อมูล\nส่วนบุคคลอย่างน้อยต้องประกอบด้วยสภาพ\n(nature),ขอบเขต(scope),บริบท(cpntext)\nและวัตถุประสงค์(purpose)ของการประมวลผล",
                                style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
