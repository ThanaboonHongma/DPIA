import 'package:dpia_project/screens/dpia_risk_assessment/counter_provider.dart';
import 'package:dpia_project/screens/dpia_risk_assessment/dpia_risk_assessment_add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RiskAssessmentPage extends StatefulWidget {
  const RiskAssessmentPage({super.key});

  @override
  State<RiskAssessmentPage> createState() => _RiskAssessmentPageState();
}

class _RiskAssessmentPageState extends State<RiskAssessmentPage> {
  final TextEditingController _impactTextController = TextEditingController();

  @override
  void dispose() {
    _impactTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'แบบฟอร์มประเมิน DPIA ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
            const Navigator();
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
                  padding: const EdgeInsets.only(right: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text(
                              'ขั้นตอนที่ 5 Risk Assessment',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text(
                              '[Risk Assessment]',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text(
                              "การประเมินความเสี่ยงที่จะมีผลกระทบต่อสิทธิเสรีภาพของบุคคล ทั้งในเชิงร่างกาย จิตใจ และทรัพย์สิน โดนคำนึงถึง “ความน่าจะเป็น” (likelihood) และ “ความร้ายแรง” (severity) โดยแต่ละความเสี่ยงอย่างน้อยควรระบุถึงรายละเอียดละเอียดต่อไปนี้",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      productList.risklist.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "ไม่มีรายการประเมินความเสี่ยง",
                                 
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 400,
                              child: ListView.builder(
                                itemCount: productList.risklist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: ExpansionTile(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: productList
                                                                  .risklist[
                                                                      index]
                                                                  .riskLevel ==
                                                              "ระดับต่ำ"
                                                          ? Color(0xffA2EDCE)
                                                          : productList
                                                                      .risklist[
                                                                          index]
                                                                      .riskLevel ==
                                                                  "ระดับกลาง"
                                                              ? Color(
                                                                  0xffEDCFA2)
                                                              : Color(
                                                                  0xffFFA8B8),
                                                    ),
                                                    padding: EdgeInsets.all(5),
                                                    child: Center(
                                                      child: Text(
                                                        ' ${productList.risklist[index].riskLevel} ',
                                                        style: TextStyle(
                                                          color: productList
                                                                      .risklist[
                                                                          index]
                                                                      .riskLevel ==
                                                                  "ระดับต่ำ"
                                                              ? Color(
                                                                  0xff0A5134)
                                                              : productList
                                                                          .risklist[
                                                                              index]
                                                                          .riskLevel ==
                                                                      "ระดับกลาง"
                                                                  ? Color(
                                                                      0xff735323)
                                                                  : Color(
                                                                      0xffAF3232),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                      'ความเสี่ยงที่ ${index + 1}'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          children: [
                                            ListTile(
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'ผลกระทบ: ${productList.risklist[index].effect}'),
                                                  Text(
                                                      'ความน่าจะเป็น: ${productList.risklist[index].probability}'),
                                                  Text(
                                                      'ความร้ายแรง: ${productList.risklist[index].severity}'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(
                                0xff23A9E1), // Background color
                          ),
                          onPressed: () {
                            showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return DpiaAddRisk();
                              },
                            );
                          },
                          child: Text(
                            "เพิ่มความเสี่ยง",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context, GlobalKey key) {
    double sheetHeight = MediaQuery.of(context).size.height * 80;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: sheetHeight,
          color: Colors.white,
          child: Center(
            child: Text('This is a custom BottomSheet'),
          ),
        );
      },
    );
  }
}
