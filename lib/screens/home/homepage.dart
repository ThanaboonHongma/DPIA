import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpia_project/models/dpia_summary.dart';
import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:dpia_project/models/home/homedescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeDescription> homedescription =
      defaltHomeDescription.map((e) => e).toList();

  Future<List<DpiaSummary>> getRiskData() async {
    List<DpiaSummary> summary = [];
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final firebase = FirebaseFirestore.instance
          .collection('DPIA_assessment')
          .where('userId', isEqualTo: user.uid);
      final documents = await firebase.get();

      summary = [];

      for (var doc in documents.docs) {
        final list = doc['riskData'] as List<dynamic>;

        List<RiskData> risks = [];
        for (var item in list) {
          if (item is Map<String, dynamic>) {
            risks.add(RiskData.fromMap(item));
          }
        }

        summary.add(DpiaSummary(risks: risks));
      }
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final dpiaProvider = Provider.of<DpiaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'DPIA LITE',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'By WiseWork',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13),
            child: SizedBox(
              width: 130,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/IdentificationPage1');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.tertiary),
                ),
                child: Text(
                  'ประเมิน DPIA',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
          )
        ],
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
                  padding: const EdgeInsets.only(right: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ..._dpiais(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Column(
              children: [
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
                      padding: const EdgeInsets.only(right: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ..._dpialistview(dpiaProvider),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     children: [
            //       ..._dpiais(),
            //       const SizedBox(
            //         height: 25,
            //       ),
            //       ..._dpialistview(dpiaProvider),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/IdentificationPage1');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _dpiais() {
    return [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Text(
            'DPIA',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color.fromRGBO(35, 169, 225, 1),
                ),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Text(
            'คือ การประเมินผลกระทบด้านความเป็นส่วนตัว (privacy impact assessment) หรือ “การประเมินผลกระทบด้านการคุ้มครองข้อมูลส่วนบุคคล”(data protection impact assessment, DPIA) เป็นเครื่องมือสำคัญที่จะช่วยให้องค์กรสามารถบริหารการจัดการความเสี่ยงด้านข้อมูลส่วนบุคคล (privacy risk) ได้อย่างเป็นระบบและเป็นรูปธรรม',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    ];
  }

  _dpialistview(DpiaProvider dpiaProvider) {
    return [
      Column(
        children: [
          Row(
            children: [
              Text(
                'รายการประเมิน DPIA',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder<List<DpiaSummary>>(
            future: getRiskData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While the Future is still running (waiting for data), display a loading indicator.
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If an error occurred, display an error message.
                return Text('Error: ${snapshot.error}');
              } else {
                // If the Future has completed successfully, display the user's information.
                final summary = snapshot.data ?? [];

                if (summary.isEmpty) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ไม่มีรายการประเมิน DPIA',
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .tertiary),
                                    ),
                                    onPressed: () {
                                      context.go('/IdentificationPage1');
                                    },
                                    child: Text(
                                      'เริ่มประเมิน DPIA',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                    )))
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: summary.length,
                    itemBuilder: (BuildContext context, int index) {
                      double progress = 0;
                      print('');
                      print('risk');
                      print(summary[index].risks.length);
                      final divider = summary[index].risks.where((element) => element.riskLevel == 'ระดับสูง').toList().length;
                      for (RiskData risk in summary[index].risks) {
                        if (risk.measures.isEmpty) continue;
                        print('start');
                        print(risk.measures.length);

                        final allMeasures = risk.measures.length;
                        int sumMeasurProgress = 0;

                        for (Measure measure in risk.measures) {
                          if (measure.percent == '') {
                            const precent = 0;
                            sumMeasurProgress += precent;
                          } else {
                            sumMeasurProgress += int.parse(measure.percent);
                          }
                        }
                        print('allMeasures $allMeasures');
                        print('sumMeasurProgress $sumMeasurProgress');

                        progress += (sumMeasurProgress / allMeasures);
                      }
                      print('divider $divider');
                      print('progress ${progress / divider}');

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'แบบประเมิน DPIA ${summary.length - index}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Text(
                                      '${summary[index].risks.last.date.day.toString()}/'
                                      '${summary[index].risks.last.date.month.toString()}/'
                                      '${summary[index].risks.last.date.year.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: summary[index].risks.isEmpty
                                          ? Text('ไม่มีความเสี่ยง',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium)
                                          : Text(
                                              '${summary[index].risks.where((element) => element.riskLevel == 'ระดับสูง').toList().length} ความเสี่ยงสูง',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: summary[index].risks.isEmpty? Text('') :Text(
                                              // ${productList.riskAssessments[index].measures[index].percent.toString()}
                                              'สถานะดำเนินการ : ${progress ~/ divider}%',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    ];
  }
}
// }
