import 'package:flutter/material.dart';

class Context extends StatefulWidget {
  const Context({super.key});

  @override
  State<Context> createState() => _ContextState();
}

class _ContextState extends State<Context> {
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
                '2.3 [Context] อธิบายบริบทของการประมวลผลข้อมูล ทั้งปัจจัยภายในและภายนอกที่อาจส่งผลต่อความความคาดหวังและผลกระทบของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้',
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
                  title:   Text('แหล่งข้อมูลส่วนบุคคล' , style: Theme.of(context).textTheme.bodyMedium ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue2 = value!;
                    });
                  },
                  title:   Text('ลักษณะของความสัมพันธ์กับเจ้าของข้อมูลส่วนบุคคล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue3 = value!;
                    });
                  },
                  title:   Text('ลักษณะของความสัมพันธ์กับเจ้าของข้อมูลของเจ้าของข้อมูลส่วนบุคคล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue4,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue4 = value!;
                    });
                  },
                  title:   Text('ระดับความคาดหวังของเจ้าของข้อมูลที่มีต่อการประมวลผลข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue5,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue5 = value!;
                    });
                  },
                  title:   Text('มีข้อมูลส่วนบุคคลของผู้เยาว์หรือผู้เปราะบางหรือไม่' , style: Theme.of(context).textTheme.bodyMedium),
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
                        Text('ประสบการณ์ที่ผ่านมาของการประมูลแบบเดียวกัน' , style: Theme.of(context).textTheme.bodyMedium),
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
                      'ความก้าวหน้าทางเทคโนโลยีหรือมาตรการความปลอดภัยทางสารสนเทศที่เกี่ยวข้อง' , style: Theme.of(context).textTheme.bodyMedium),
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
                      'ประเด็นที่เป็นข้อวิตกกังวลของสาธารณะ' , style: Theme.of(context).textTheme.bodyMedium),
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
                      'มีการปฏิบัติตามมาตรฐานหรือแนวปฏิบัติที่เกี่ยวข้องหรือไม่' , style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}