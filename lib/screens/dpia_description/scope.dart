import 'package:flutter/material.dart';

class ScopePage extends StatefulWidget {
    ScopePage({super.key});

  @override
  State<ScopePage> createState() => _ScopePageState();
}

class _ScopePageState extends State<ScopePage> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;
  bool checkboxValue6 = false;
  bool checkboxValue7 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset:   Offset(0, 8),
              ),
            ],
          ),
        child: Column(
          children: [
            ExpansionTile(
              title: Text(
                '2.2 [Scope] ระบุขอบเขตของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              children: <Widget>[
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue1 = value!;
                    });
                  },
                  title:   Text('สภาพและลักษณะของข้อมูลส่วนบุคคล' , style: Theme.of(context).textTheme.bodyMedium ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue2 = value!;
                    });
                  },
                  title:   Text('ปริมาณและความหลากหลายของข้อมูลส่วนบุคคล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue3 = value!;
                    });
                  },
                  title:   Text('ความอ่อนไหวของข้อมูลส่วนบุคคล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue4,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue4 = value!;
                    });
                  },
                  title:   Text('ระดับและความถี่ของการประมวล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue5,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue5 = value!;
                    });
                  },
                  title:   Text('ระยะเวลาของการประมวลผลข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue6,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue6 = value!;
                    });
                  },
                  title:
                        Text('จำนวนของเจ้าของข้อมูลส่วนบุคคลที่เกี่ยวข้อง' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue7,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue7 = value!;
                    });
                  },
                  title:   Text(
                      'พื้นที่เชิงภูมิศาสตร์ที่การประมวลข้อมูลครอบคลุมไปถึง' , style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
