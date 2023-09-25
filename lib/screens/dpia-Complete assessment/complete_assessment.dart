import 'package:dpia_project/models/NecessityandProportionlity/necessityandproportionlity.dart';
import 'package:dpia_project/models/activity.dart';
import 'package:dpia_project/models/consultation/consultation.dart';
import 'package:dpia_project/models/descriptions/description.dart';
import 'package:dpia_project/models/monitoring/monitoring.dart';
import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แบบฟอร์มประเมิน DPIA',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/CompletePage/iconpass.png'),
            const SizedBox(height: 16), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
            Text(
              'ทำประเมินเสร็จสิ้น!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final provider =
                        Provider.of<DpiaProvider>(context, listen: false);
                    // print('หน้าที่ 1');
                    // print(provider.checkboxValue1);
                    // print(provider.checkboxValue2);
                    // for (Activity activity in provider.activities) {
                    //   print('${activity.id} ${activity.isChecked}');
                    // }
                    // print('หน้าที่ 2');
                    // for (Description descriptions in provider.descriptions) {
                    //   print('${descriptions.id} ${descriptions.list}');
                    // }
                    // print('หน้าที่ 3');
                    // for (Consultation consultations in provider.consultations) {
                    //   print('${consultations.id} ${consultations.isChecked}');
                    // }
                    // print('หน้าที่ 4');
                    // for (NecessityandProportionlity necessity in provider.necessityandProportionlitys) {
                    //   print('${necessity.id} ${necessity.list}');
                    // }
                    // print('หน้าที่ 5');
                    // for (RiskData riskData in provider.riskAssessments) {
                    //   print('${riskData.id} ${riskData.effect} ${riskData.probability} ${riskData.riskLevel}');
                    // }
                    // print('หน้าที่ 6');
                    // for (RiskData riskData in provider.riskAssessments) {
                    //   print('${riskData.measures} ');
                    // }
                    // print('หน้าที่ 7');
                    // for (Monitoring monitoring in provider.monitoring) {
                    //   print('${monitoring.agency} ${monitoring.responsible} ');
                    // }

                    context.pushReplacement('/HomePage');
                  },
                  child: const Text('OK')),
            ),
          ],
        ),
      ),
    );
  }
}
