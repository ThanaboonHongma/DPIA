import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MitigatingMeasures extends StatefulWidget {
  const MitigatingMeasures({
    super.key,
  });

  @override
  State<MitigatingMeasures> createState() => _MitigatingMeasuresState();
}

class _MitigatingMeasuresState extends State<MitigatingMeasures> {
  @override
  Widget build(BuildContext context) {
    final dpiaProvider = Provider.of<DpiaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          onTap: () {
            context.go('/RiskAssessmentPage');
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
            Column(
              children: [
                const SizedBox(height: 10),
                ..._mitigatingis(),
                const SizedBox(height: 15),
                _buildRiskListVIew(dpiaProvider),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  ListView _buildRiskListVIew(DpiaProvider dpiaProvider) {
    final riskAssessments = dpiaProvider.riskAssessments
        .where((risk) => risk.riskLevel == 'ระดับสูง')
        .toList();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: riskAssessments.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            riskAssessments[index].effect,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Container(
                            width: 80,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffFFA8B8),
                            ),
                            child: Text(
                              'ระดับสูง',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: const Color(0xFFAF3232)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: riskAssessments[index].measures.isNotEmpty
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'ความเห็นของ DPO: ${riskAssessments[index].measures[0].dpo}',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Text(
                                    'สถานะการดำเนินการ: ${riskAssessments[index].measures[0].percent.toString()} %',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              )
                            : null,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.go(
                                  '/AddMitigatingMeasuresPage/${riskAssessments[index].id}',
                                );
                              },
                              child: Text(
                                'เพิ่ม/แก้ไขมาตรการ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
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
                  context.go('/RiskAssessmentPage');
                },
                child: const Text('ย้อนกลับ')),
          ),
          const Text(
            '6 / 7',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    context.go('/MonitoringPage');
                  },
                  child: const Text('ถัดไป'))),
        ],
      ),
    );
  }

  _mitigatingis() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            padding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: Text(
                      'ขั้นตอนที่ 6 Mitigating measures',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: Text(
                      '[Mitigating measures]',
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
                      'ระบุมาตรการเพื่อลดความเสี่ยงแต่ละรายการจากขั้นตอนที่ 5 โดยควรระบุว่ามาตรการดังกล่าวสามารถลดหรือกำจัดความเสี่ยงได้หรือไม่ อย่างไร ข้อดีข้อเสียของแต่ละมาตรการที่เลือกใช้',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
