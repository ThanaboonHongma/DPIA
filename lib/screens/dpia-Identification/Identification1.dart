import 'package:dpia_project/models/activity.dart';
import 'package:flutter/material.dart';

class Identification1 extends StatefulWidget {
  const Identification1({super.key});

  @override
  State<Identification1> createState() => _Identification1State();
}

class _Identification1State extends State<Identification1> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  @override
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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('ขั้นตอนที่ 1 [DPIA Identification]',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(35, 169, 225, 1),
                              fontSize: 16)),
                    ),
                    const Divider(
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
                      child: Text('[DPIA Identification]'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'การระบุความจำเป็นในการทำ DPIA ตามประเภทของการประมวลผลข้อมูล หรือโครงการที่จะมีการประมูลข้อมูล ทั้งที่เป็นโครงการใหม่หรือที่มีการปรับปรุงเปลี่ยนแปลงการประมวลข้อมูลที่มีอยู่เดิม โดยระบุลักษณะที่แสดงถึงความจำเป็น รวมถึงแหล่งอ้างอิงที่เหมาะสม'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                        value: checkboxValue1,
                        onChanged: (bool? value) {
                          setState(() {
                            checkboxValue1 = value!;
                          });
                        },
                        title: const Text('จำเป็น อ้างอิงตาม')),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                          value: checkboxValue2,
                          onChanged: (bool? value) {
                            setState(() {
                              checkboxValue2 = value!;
                            });
                          },
                          title: const Text('ประกาศหรือบัญชีรายชื่อ')),
                    ),
                  ],
                ),
              ),
            ),
            const ActivityListview(),
          ],
        ),
      ),
    );
  }
}

class ActivityListview extends StatefulWidget {
  const ActivityListview({super.key});

  @override
  State<ActivityListview> createState() => _ActivityListviewState();
}

class _ActivityListviewState extends State<ActivityListview> {
   List<Activity> activities=defaultActivities.map((e) => e).toList();
 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
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
        child: ExpansionTile(
          title: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-16, 0),
              child: Text(activities[index].title),
            ),
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
            value: activities[index].isChecked,
            onChanged: (bool? value) {
              List<Activity> temp = [
                for (Activity activity in activities) activity == activities[index]
                    ? activity.copyWith(isChecked: value)
                    : activity
              ];
              setState(() {
                activities = temp;
              });
            },
          ),
          children: <Widget>[
            const Divider(
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.grey,
            ),
            ListTile(title: Text(activities[index].subtitle)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(title: Text(activities[index].description)),
            ),
          ],
        ),
      ),
      itemCount: activities.length,
    );
  }
}
