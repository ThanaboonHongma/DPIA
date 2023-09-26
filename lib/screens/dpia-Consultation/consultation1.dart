import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'แบบฟอร์มประเมิน DPIA',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
            context.go('/DpiaDescriptionPage');
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'ขั้นตอนที่ 3 DPIA Consultation',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: const Color.fromRGBO(35, 169, 225, 1),
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
                          '[DPIA Consultation]',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'ระบุเหตุผล, วิธีการ, และช่วงเวลาที่จะปรึกษาหารือและรับฟังความเห็น รวมถึงกรณีที่จะไม่ปรึกษาหารือและรับฟังความเห็นด้วย อย่างน้อยจากผู้เกี่ยวข้องต่อไปนี้',
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
            const ConsultationListview(),
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
                      side: const BorderSide(color: Color(0xff2684FF)),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Transform.translate(
                        offset: const Offset(-16, 0),
                        child: const Text("อื่นๆ (โปรดระบุ)"),
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
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "ระบุข้อมูล"),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
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
                context.go('/DpiaDescriptionPage');
              },
              child: const Text('ย้อนกลับ')),
        ),
        const Text(
          '3 / 7',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
                onPressed: () {
                  context.go('/NecessityandProportionlityPage');
                },
                child: const Text('ถัดไป'))),
      ],
    ),
  );
}

class ConsultationListview extends StatefulWidget {
  const ConsultationListview({super.key});

  @override
  State<ConsultationListview> createState() => _ConsultationListviewState();
}

class _ConsultationListviewState extends State<ConsultationListview> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DpiaProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.consultations.length,
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
          5,
        ),
        child: Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: CheckboxListTile(
              side: const BorderSide(color: Color(0xff2684FF)),
              contentPadding: EdgeInsets.zero,
              title: Transform.translate(
                offset: const Offset(-16, 0),
                child: Text(provider.consultations[index].title),
              ),
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
              value: provider.consultations[index].isChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  provider.checkConsultations(index, value);
                }
              },
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListTile(
                    title: Text(provider.consultations[index].description,
                        style: Theme.of(context).textTheme.titleSmall)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
