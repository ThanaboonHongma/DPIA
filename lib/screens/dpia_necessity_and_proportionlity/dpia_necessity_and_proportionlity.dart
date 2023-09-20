import 'package:dpia_project/screens/dpia_necessity_and_proportionlity/necessity_and_proportionlity_listview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NecessityandProportionlityPage extends StatefulWidget {
  const NecessityandProportionlityPage({super.key});

  @override
  State<NecessityandProportionlityPage> createState() =>
      _NecessityandProportionlityPageState();
}

class _NecessityandProportionlityPageState
    extends State<NecessityandProportionlityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            context.go('/Consultation');
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
                                'ขั้นตอนที่ 4\nDPIA Necessity and proportionlity',
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
                                '[DPIA Necessity and proportionlity]',
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
                                "อธิบายความจำเป็นและความได้สัดส่วนของการประมวลผลข้อมูล โดยอาจระบุเนื้อหาต่อไปนี้",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const NecessityandProportionlityListview(),
                        ],
                      ),
                    ),
                  )),
            ),
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
                  context.go('/Consultation');
                },
                child: const Text('ย้อนกลับ')),
          ),
          const Text(
            '4 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    context.go('/RiskAssessmentPage');
                  },
                  child: const Text('ถัดไป'))),
        ],
      ),
    );
  }
}
