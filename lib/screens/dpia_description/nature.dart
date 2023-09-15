import 'package:flutter/material.dart';

class Nature extends StatefulWidget {
     Nature({super.key});

  @override
  State<Nature> createState() => _NatureState();
}

class _NatureState extends State<Nature> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;
  bool checkboxValue6 = false;
  bool checkboxValue7 = false;
  bool checkboxValue8 = false;
  bool checkboxValue9 = false;
  bool checkboxValue10 = false;
  bool checkboxValue11 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:    EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset:    Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            ExpansionTile(
              title: Text(
                '2.1 [Nature] อธิบายสภาพของการประมวลผลข้อมูล โดยรวมถึงรายละเอียดต่อไปนี้',
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
                  title:  Text('การเก็บรวบรวมข้อมูล', style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue2 = value!;
                    });
                  },
                  title:    Text('การจัดเก็บข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue3 = value!;
                    });
                  },
                  title:    Text('การใช้ข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue4,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue4 = value!;
                    });
                  },
                  title:    Text('ผู้ที่สามารถเข้าถึงข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue5,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue5 = value!;
                    });
                  },
                  title:    Text('ผู้ที่ได้รับข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue6,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue6 = value!;
                    });
                  },
                  title:    Text('ผู้ประมวลผลข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue7,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue7 = value!;
                    });
                  },
                  title:    Text('ระยะเวลาจัดเก็บข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue8,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue8 = value!;
                    });
                  },
                  title:    Text('มาตรการความปลอดภัย' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue9,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue9 = value!;
                    });
                  },
                  title:    Text('เทคโนโลยีใหม่ที่ใช่ในการประมวลผลข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue10,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue10 = value!;
                    });
                  },
                  title:    Text('กระบวนการแบบใหม่ที่ใช้ในประมวลผลข้อมูล' , style: Theme.of(context).textTheme.bodyMedium),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue11,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue11 = value!;
                    });
                  },
                  title:    Text(
                      'ปัจจัยที่ทำให้มีความเสี่ยงสูงที่จะมีผลกระทบต่อสิทธิเสรีภาพของบุคคล', style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
