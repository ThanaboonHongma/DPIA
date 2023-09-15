import 'package:flutter/material.dart';

class Purpose extends StatefulWidget {
  const Purpose({super.key});

  @override
  State<Purpose> createState() => _PurposeState();
}

class _PurposeState extends State<Purpose> {
bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;

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
                '2.4 [Purpose] อธิบายวัตถุประสงค์ของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้',
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
                  title:   Text('ผลลัพธ์ที่ต้องการสำหรับผู้ควบคุมข้อมูล' , style: Theme.of(context).textTheme.bodyMedium ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue2 = value!;
                    });
                  },
                  title:   Text('ฐานประโยชน์อันชอบธรรม (legitimate interest) (ถ้ามี)' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue3 = value!;
                    });
                  },
                  title:   Text('ผลลัพธ์ที่ต้องการสำหรับบุคคล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue4,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue4 = value!;
                    });
                  },
                  title:   Text('ประโยชน์ที่คาดว่าจะได้รับสำหรับผู้ควบคุมข้อมูลหรือสังคมโดยรวม' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                
                
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}