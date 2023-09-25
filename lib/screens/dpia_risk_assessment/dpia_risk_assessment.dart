import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:dpia_project/screens/dpia_risk_assessment/dpia_risk_assessment_add_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RiskAssessmentPage extends StatefulWidget {
  const RiskAssessmentPage({super.key});

  @override
  State<RiskAssessmentPage> createState() => _RiskAssessmentPageState();
}

class _RiskAssessmentPageState extends State<RiskAssessmentPage> {
  final TextEditingController _impactTextController = TextEditingController();
  int _expandedTileIndex = -1;

  @override
  void dispose() {
    _impactTextController.dispose();
    super.dispose();
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
            context.go('/NecessityandProportionlityPage');
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
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
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
                      dpiaProvider.riskAssessments.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "ไม่มีรายการประเมินความเสี่ยง",
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 300,
                              child: ListView.builder(
                                itemCount: dpiaProvider.riskAssessments.length,
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
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: Theme(
                                          data: ThemeData(
                                              dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            onExpansionChanged:
                                                (bool isExpanded) {
                                              // เมื่อมีการ expand หรือ collapse ExpansionTile
                                              setState(() {
                                                _expandedTileIndex =
                                                    isExpanded ? index : -1;
                                              });
                                            },
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      decoration:
                                                          _expandedTileIndex ==
                                                                  index
                                                              ? BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: dpiaProvider.riskAssessments[index].riskLevel ==
                                                                            "ระดับต่ำ"
                                                                        ? const Color(
                                                                            0xff00FF96)
                                                                        : dpiaProvider.riskAssessments[index].riskLevel ==
                                                                                "ระดับกลาง"
                                                                            ? const Color(0xffFF8700)
                                                                            : const Color(0xffFF0000),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: dpiaProvider
                                                                              .riskAssessments[
                                                                                  index]
                                                                              .riskLevel ==
                                                                          "ระดับต่ำ"
                                                                      ? const Color(
                                                                          0xffA2EDCE)
                                                                      : dpiaProvider.riskAssessments[index].riskLevel ==
                                                                              "ระดับกลาง"
                                                                          ? const Color(
                                                                              0xffEDCFA2)
                                                                          : const Color(
                                                                              0xffFFA8B8),
                                                                )
                                                              : BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: dpiaProvider
                                                                              .riskAssessments[
                                                                                  index]
                                                                              .riskLevel ==
                                                                          "ระดับต่ำ"
                                                                      ? const Color(
                                                                          0xffA2EDCE)
                                                                      : dpiaProvider.riskAssessments[index].riskLevel ==
                                                                              "ระดับกลาง"
                                                                          ? const Color(
                                                                              0xffEDCFA2)
                                                                          : const Color(
                                                                              0xffFFA8B8),
                                                                ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Center(
                                                        child: Text(
                                                          ' ${dpiaProvider.riskAssessments[index].riskLevel} ',
                                                          style: TextStyle(
                                                            color: dpiaProvider
                                                                        .riskAssessments[
                                                                            index]
                                                                        .riskLevel ==
                                                                    "ระดับต่ำ"
                                                                ? const Color(
                                                                    0xff0A5134)
                                                                : dpiaProvider
                                                                            .riskAssessments[
                                                                                index]
                                                                            .riskLevel ==
                                                                        "ระดับกลาง"
                                                                    ? const Color(
                                                                        0xff735323)
                                                                    : const Color(
                                                                        0xffAF3232),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      'ความเสี่ยงที่ ${index + 1}',
                                                    ),
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
                                                      'ผลกระทบ: ${dpiaProvider.riskAssessments[index].effect}',
                                                    ),
                                                    Text(
                                                      'ความน่าจะเป็น: ${dpiaProvider.riskAssessments[index].probability}',
                                                    ),
                                                    Text(
                                                      'ความร้ายแรง: ${dpiaProvider.riskAssessments[index].severity}',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
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
                            backgroundColor:
                                const Color(0xff23A9E1), // Background color
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
                          child: const Text(
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
      bottomNavigationBar: buildMyNavBar(context),
    );
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
                context.go('/NecessityandProportionlityPage');
              },
              child: const Text('ย้อนกลับ'),
            ),
          ),
          const Text(
            '5 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                context.go('/MitigatingMeasuresPage');
              },
              child: const Text('ถัดไป'),
            ),
          ),
        ],
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
          child: const Center(
            child: Text('This is a custom BottomSheet'),
          ),
        );
      },
    );
  }
}
