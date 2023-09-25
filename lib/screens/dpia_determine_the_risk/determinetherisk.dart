// ignore_for_file: file_names
import 'package:dpia_project/models/dpia_determine_the_risk/determinetherisk.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class IdentificationPage1 extends StatefulWidget {
  const IdentificationPage1({super.key});

  @override
  State<IdentificationPage1> createState() => _IdentificationPage1State();
}

const List<String> list = <String>[
  '-- Select --',
  'Systematic and extensive profiling with significant effects',
  'Processing of sensitive data on a large scale',
  'Public monitoring on a large scale'
];

class _IdentificationPage1State extends State<IdentificationPage1> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  final textController5 = TextEditingController();
  final textController6 = TextEditingController();
  String dropdownValue = list.first;
  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    textController5.dispose();
    textController6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'แบบฟอร์มประเมิน DPIA',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ],
            ),
          ],
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          onTap: () {
            context.go('/HomePage');
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            'ขั้นตอนที่ 1 กำหนดระดับความเสี่ยงของข้อมูล',
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
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'กำหนดความเสี่ยงของข้อมูลส่วนบุคคลชุดต่างๆ โดยอย่างน้อยคำนึงถึง',
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Identifiable'),
                      SizedBox(
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
                      SizedBox(
                        height: 10,
                      ),
                      const Text('Access'),
                      SizedBox(
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
                        height: 10,
                      ),
                      const Text('Activity'),
                      SizedBox(
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Volume'),
                      SizedBox(
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Volume options'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: DropdownMenu<String>(
                          width: 340,
                          initialSelection: list.first,
                          onSelected: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Adverse Effects to Data Subjects'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: textController5,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Adverse Effects to Organization'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: textController6,
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
          ],
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
          const SizedBox(
            width: 100,
            height: 40,
            // child: ElevatedButton(
            //     onPressed: () {}, child: const Text('ย้อนกลับ')),
          ),
          const Text(
            '1 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    dpiaProvider.saveDetermine(Determine(
                        id: const Uuid().v4(),
                        identifiable: textController1.text,
                        access: textController2.text,
                        activity: textController3.text,
                        volume: textController4.text,
                        dropdown: dropdownValue,
                        datasubjects: textController5.text,
                        organization: textController6.text));
                    if (dropdownValue != '-- Select --') {
                      context.go('/Identification');
                    }else {
                      context.go('/CompletePageNoRisk');
                    }
                  },
                  child: const Text('ถัดไป'))),
        ],
      ),
    );
  }
}
