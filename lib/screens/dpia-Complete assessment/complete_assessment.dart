import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpia_project/models/NecessityandProportionlity/necessityandproportionlity.dart';
import 'package:dpia_project/models/activity.dart';
import 'package:dpia_project/models/consultation/consultation.dart';
import 'package:dpia_project/models/descriptions/description.dart';
import 'package:dpia_project/models/dpia_determine_the_risk/determinetherisk.dart';
import 'package:dpia_project/models/monitoring/monitoring.dart';
import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CompletePage extends StatelessWidget {
  CompletePage({Key? key}) : super(key: key);

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
                  onPressed: () async {
                    final provider =
                        Provider.of<DpiaProvider>(context, listen: false);
                    Map<String, dynamic> map = {};

                    print('หน้าที่ 1.1');
                    List<Map<String, dynamic>> page0 = [];
                    for (Determine determine in provider.determine) {
                      page0.add(determine.toMap());
                    }
                    // print(page0);
                    List<Determine> dataDetermine = [];
                    for (var item in page0) {
                      final determinedata =
                          Determine.fromMap(item as Map<String, dynamic>);
                      dataDetermine.add(determinedata);
                    }
                    // print(dataDetermine);
                    map.addAll({'determine': page0});
                    print('หน้าที่ 1.2');
                    List<Map<String, dynamic>> page1 = [];
                    for (Activity activity in provider.activities) {
                      page1.add(activity.toMap());
                    }
                    final checkboxValue1 = {
                      'necessaryCheckbox': provider.checkboxValue1
                    };
                    final checkboxValue2 = {
                      'rosterCheckbox': provider.checkboxValue2
                    };
                    map.addAll({'activities': page1});
                    map.addAll(checkboxValue1);
                    map.addAll(checkboxValue2);
                    // print(page1);
                    //ดึงกับมาใช้-----
                    List<Activity> dataActivity = [];
                    for (var item in page1) {
                      final activitdata =
                          Activity.fromMap(item as Map<String, dynamic>);
                      dataActivity.add(activitdata);
                    }

                    print(checkboxValue1['necessaryCheckbox'] as bool);
                    // print(dataActivity);
                    //--------------------
                    print('หน้าที่ 2');
                    List<Map<String, dynamic>> page2 = [];
                    for (Description descriptionData in provider.descriptions) {
                      page2.add(descriptionData.toMap());
                    }
                    map.addAll({'descriptions': page2});
                    // print(page2);
                    //ดึงกับมาใช้-----
                    List<Description> dataDescription = [];
                    for (var item in page2) {
                      final desdata =
                          Description.fromMap(item as Map<String, dynamic>);
                      dataDescription.add(desdata);
                    }
                    //--------------------
                    print('หน้าที่ 3');
                    List<Map<String, dynamic>> page3 = [];
                    for (Consultation consultations in provider.consultations) {
                      page3.add(consultations.toMap());
                    }
                    map.addAll({'consultations': page3});
                    // print(page3);
                    //ดึงกับมาใช้-----
                    List<Consultation> dataconsultations = [];
                    for (var item in page3) {
                      final consultations =
                          Consultation.fromMap(item as Map<String, dynamic>);
                      dataconsultations.add(consultations);
                    }
                    // print(dataconsultations);
                    //--------------------
                    print('หน้าที่ 4');
                    List<Map<String, dynamic>> page4 = [];
                    for (NecessityandProportionlity necessity
                        in provider.necessityandProportionlitys) {
                      page4.add(necessity.toMap());
                      // print('${necessity.id} ${necessity.list}');
                    }
                    map.addAll({'necessityandProportionlitys': page4});
                    // print(page4);
                    //ดึงกับมาใช้-----
                    List<NecessityandProportionlity> datanecessity = [];
                    for (var item in page4) {
                      final necessitys = NecessityandProportionlity.fromMap(
                          item as Map<String, dynamic>);
                      datanecessity.add(necessitys);
                    }
                    // print(datanecessity);

                    //--------------------
                    print('หน้าที่ 5');
                    List<Map<String, dynamic>> page5 = [];
                    for (RiskData riskData in provider.riskAssessments) {
                      page5.add(riskData.toMap());
                    }
                    map.addAll({'riskData': page5});
                    print(page5);
                    //ดึงกับมาใช้-----
                    List<RiskData> datarisk = [];
                    for (var item in page5) {
                      final riskdatas =
                          RiskData.fromMap(item as Map<String, dynamic>);
                      datarisk.add(riskdatas);
                    }
                    print(datarisk);

                    //--------------------
                    print('หน้าที่ 7');
                    List<Map<String, dynamic>> page7 = [];
                    for (Monitoring monitoring in provider.monitoring) {
                      page7.add(monitoring.toMap());
                    }
                    map.addAll({'monitorings': page7});
                    // print(page7);
                    //ดึงกับมาใช้-----
                    List<Monitoring> datamonitoring = [];
                    for (var item in page7) {
                      final monitorings =
                          Monitoring.fromMap(item as Map<String, dynamic>);
                      datamonitoring.add(monitorings);
                    }
                    // print(datamonitoring.toString());
                    //--------------------
                    // print(map);
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      map.addAll({'userId': user.uid});
                      final firebase = FirebaseFirestore.instance
                          .collection('DPIA_assessment')
                          .doc();
                      await firebase.set(map).then((value) {
                        context.pushReplacement('/HomePage');
                        Provider.of<DpiaProvider>(context, listen: false)
                            .reset();
                        Provider.of<DpiaProvider>(context, listen: false)
                            .setupData();
                            
                      });
                    }
                  },
                  child: const Text('OK')),
            ),
          ],
        ),
      ),
    );
  }
}
