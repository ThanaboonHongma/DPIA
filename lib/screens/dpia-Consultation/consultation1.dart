import 'package:dpia_project/models/consultation.dart';
import 'package:flutter/material.dart';

class Consultation1 extends StatefulWidget {
  const Consultation1({super.key});

  @override
  State<Consultation1> createState() => _Consultation1State();
}

class _Consultation1State extends State<Consultation1> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool showTextField = false;
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
                      child: Text('ขั้นตอนที่ 3 DPIA Consultation',
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
                      child: Text('[DPIA Consultation]'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'ระบุเหตุผล, วิธีการ, และช่วงเวลาที่จะปรึกษาหารือและรับฟังความเห็น รวมถึงกรณีที่จะไม่ปรึกษาหารือและรับฟังความเห็นด้วย อย่างน้อยจากผู้เกี่ยวข้องต่อไปนี้'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            ConsultationListview(),
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
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Transform.translate(
                        offset: const Offset(-16, 0),
                        child: Text("อื่นๆ (โปรดระบุ)"),
                      ),
                      value: showTextField,
                      onChanged: (newValue) {
                        setState(() {
                          showTextField = newValue ??
                              false; // Update the state when the checkbox changes
                        });
                      },
                    ),
                    if (showTextField)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "โปรดกรอก"),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultationListview extends StatefulWidget {
  const ConsultationListview({super.key});

  @override
  State<ConsultationListview> createState() => _ConsultationListviewState();
}

class _ConsultationListviewState extends State<ConsultationListview> {
  List<Consultation> consultations = defaultConsultation.map((e) => e).toList();

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
              child: Text(consultations[index].title),
            ),
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
            value: consultations[index].isChecked,
            onChanged: (bool? value) {
              List<Consultation> temp = [
                for (Consultation consultation in consultations)
                  consultation == consultations[index]
                      ? consultation.copyWith(isChecked: value)
                      : consultation
              ];
              setState(() {
                consultations = temp;
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
            ListTile(title: Text(consultations[index].subtitle)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(title: Text(consultations[index].description)),
            ),
          ],
        ),
      ),
      itemCount: consultations.length,
    );
  }
}
