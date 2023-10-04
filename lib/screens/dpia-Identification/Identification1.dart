// ignore_for_file: file_names
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:dpia_project/utilities/responsive.dart';
import 'package:dpia_project/utilities/savedata.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Identification1 extends StatefulWidget {
  const Identification1({super.key});

  @override
  State<Identification1> createState() => _Identification1State();
}

class _Identification1State extends State<Identification1> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DpiaProvider>(context);

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
            context.go('/IdentificationPage1');
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'ขั้นตอนที่ 1 DPIA Identification',
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
                          'การระบุความจำเป็นในการทำ DPIA ตามประเภทของการประมวลผลข้อมูล หรือโครงการที่จะมีการประมูลข้อมูล ทั้งที่เป็นโครงการใหม่หรือที่มีการปรับปรุงเปลี่ยนแปลงการประมวลข้อมูลที่มีอยู่เดิม โดยระบุลักษณะที่แสดงถึงความจำเป็น รวมถึงแหล่งอ้างอิงที่เหมาะสม',
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        side: const BorderSide(color: Color(0xff2684FF)),
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                        value: provider.checkboxValue1,
                        onChanged: (bool? value) {
                          if (value != null) {
                            provider.checkBool1Activity(value);
                          }
                        },
                        title: Transform.translate(
                          offset: const Offset(-16, 0),
                          child: Text(
                              "ประกาศหรือบัญชีรายชื่อการประมวลผลข้อมูลส่วนบุคคลของสำนักงานคุ้มครองข้อมูลส่วนบุคคลที่จำเป็นต้องจักทำ DPIA",
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CheckboxListTile(
                          side: const BorderSide(color: Color(0xff2684FF)),
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                          value: provider.checkboxValue2,
                          onChanged: (bool? value) {
                            if (value != null) {
                              provider.checkBool2Activity(value);
                            }
                          },
                          title: Transform.translate(
                            offset: const Offset(-16, 0),
                            child: Text(
                                "Thailand Data Protection Guidelines 2.0 ส่วนที่ E1",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Responsive.isMobile(context)
                  ? 540
                  : Responsive.isTablet(context)
                      ? 980
                      : 1480,
              child: ActivityListview(
                provider: provider,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    bool isButtonPressed = false;
    final provider = Provider.of<DpiaProvider>(context);
    List countTEST = [];
    List countTEST2 = [];
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
                  context.go('/IdentificationPage1');
                },
                child: const Text('ย้อนกลับ')),
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
                      // ignore: dead_code
                      ? null
                      : () async {
                          setState(() {
                            isButtonPressed = true;
                          });

                          for (int i = 0; i <= 8; i++) {
                            if (provider.activities[i].isChecked == true) {
                              countTEST.add(provider.activities[i]);
                            }
                          }
                          for (int j = 9; j <= 18; j++) {
                            if (provider.activities[j].isChecked == true) {
                              countTEST2.add(provider.activities[j]);
                            }
                          }
                          if ((countTEST.isNotEmpty && countTEST.length >= 2) ||
                              countTEST2.isNotEmpty ||
                              (provider.checkboxValue2 == true ||
                                  provider.checkboxValue1 == true) ||
                              provider.checkselectedItems.isNotEmpty) {
                            context.go('/DpiaDescriptionPage');
                          } else if (countTEST.length == 1 ||
                              (provider.checkboxValue2 == false ||
                                  provider.checkboxValue1 == false)) {
                            savedata(context);
                            Provider.of<DpiaProvider>(context, listen: false)
                                .reset();
                            Provider.of<DpiaProvider>(context, listen: false)
                                .setupData();
                            context.go('/CompleteNoRiskPage');
                          }
                        },
                  child: const Text('ถัดไป'))),
        ],
      ),
    );
  }
}

class ActivityListview extends StatefulWidget {
  const ActivityListview({super.key, required this.provider});

  final DpiaProvider provider;

  @override
  State<ActivityListview> createState() => _ActivityListviewState();
}

class _ActivityListviewState extends State<ActivityListview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.provider.activities.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
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
          margin: const EdgeInsets.all(
            5,
          ),
          child: Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left : 20 , top: 10),
                  child: CheckboxListTile(
                    side: const BorderSide(color: Color(0xff2684FF)),
                    contentPadding: EdgeInsets.zero,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: Text(widget.provider.activities[index].title),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: widget.provider.activities[index].isChecked,
                    onChanged: (bool? value) {
                      if (value != null) {
                        widget.provider.checkActivity(index, value);
                      }
                    },
                  ),
                ),
                const Divider(
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 16), // Adjust padding as needed
                  child: ListTile(
                    title: Text(
                      widget.provider.activities[index].description,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
