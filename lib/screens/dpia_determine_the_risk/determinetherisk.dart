import 'package:dpia_project/models/dpia_determine_the_risk/determinetherisk.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class IdentificationPage1 extends StatefulWidget {
  const IdentificationPage1({super.key});

  @override
  State<IdentificationPage1> createState() => _IdentificationPage1State();
}

final List<String> items = [
  'Systematic and extensive profiling with significant effects',
  'Processing of sensitive data on a large scale',
  'Public monitoring on a large scale',
];
List<String> selectedItems = [];

class _IdentificationPage1State extends State<IdentificationPage1> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  final textController5 = TextEditingController();
  final textController6 = TextEditingController();
  String dropdownValue = 'Select Items';
  bool isButtonPressed = false;

  void resetPage() {
    setState(() {
      textController1.clear();
      textController2.clear();
      textController3.clear();
      textController4.clear();
      textController5.clear();
      textController6.clear();
      selectedItems.clear();
      dropdownValue = 'Select Items';
    });
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
            resetPage();
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
                      const Text('Access'),
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
                        height: 10,
                      ),
                      const Text('Activity'),
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Volume'),
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Volume options'),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Items',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                enabled: false,
                                child: StatefulBuilder(
                                  builder: (context, menuSetState) {
                                    final isSelected =
                                        selectedItems.contains(item);
                                    return InkWell(
                                      onTap: () {
                                        isSelected
                                            ? selectedItems.remove(item)
                                            : selectedItems.add(item);
                                        setState(() {});
                                        menuSetState(() {});

                                        dropdownValue = item;
                                        // print(selectedItems);
                                      },
                                      child: Container(
                                        height: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            if (isSelected)
                                              const Icon(
                                                Icons.check_box_outlined,
                                                color: Colors.blue,
                                              )
                                            else
                                              const Icon(
                                                Icons.check_box_outline_blank,
                                                color: Colors.grey,
                                              ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            value: selectedItems.isEmpty
                                ? null
                                : selectedItems.last,
                            onChanged: (value) {},
                            selectedItemBuilder: (context) {
                              return items.map(
                                (item) {
                                  return Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      selectedItems.join(', '),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  );
                                },
                              ).toList();
                            },
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                              ),
                              padding:
                                  const EdgeInsets.only(left: 16, right: 8),
                              height: 40,
                              width: 400,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Adverse Effects to Data Subjects'),
                      const SizedBox(
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
                      const SizedBox(
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
          ),
          const Text(
            '1 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: isButtonPressed
                  ? null
                  : () async {
                      setState(() {
                        isButtonPressed = true;
                      });

                      dpiaProvider.saveDetermine(Determine(
                          id: const Uuid().v4(),
                          identifiable: textController1.text,
                          access: textController2.text,
                          activity: textController3.text,
                          volume: textController4.text,
                          dropdown: selectedItems,
                          datasubjects: textController5.text,
                          organization: textController6.text));
                      dpiaProvider.setcheckselectedItems(selectedItems);
                      context.go('/Identification');
                    },
              child: const Text('ถัดไป'),
            ),
          ),
        ],
      ),
    );
  }
}
