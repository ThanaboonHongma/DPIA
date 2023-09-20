import 'package:dpia_project/models/mitigatingdescription/mitigatingdescription.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MitigatingMeasures extends StatefulWidget {
  const MitigatingMeasures({super.key});

  @override
  State<MitigatingMeasures> createState() => _MitigatingMeasuresState();
}

class _MitigatingMeasuresState extends State<MitigatingMeasures> {
  List<MitigatingDescription> mitigatingdescription =
      defaltMitigatingDescription.map((e) => e).toList();

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
                const SizedBox(
                  height: 10,
                ),
                ..._mitigatingis(),
                const SizedBox(
                  height: 15,
                ),
                ..._mitigatingview(),
              ],
            )
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
              padding: const EdgeInsets.only(
                  left: 20, top: 20, bottom: 20, right: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Text(
                        'ขั้นตอนที่ 6 Mitigating measures',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Color.fromRGBO(35, 169, 225, 1),
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
                        style: Theme.of(context).textTheme.titleMedium,
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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    ];
  }

  _mitigatingview() {
    return [
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mitigatingdescription.length,
        itemBuilder: (BuildContext context, int index) {
          if (mitigatingdescription[index].dpo.isEmpty) {
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
                              Text('ทำให้ไม่สามารถใช้สิทธิได้ตามสมควร',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
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
                                        ?.copyWith(
                                            color: const Color(0xFFAF3232)),
                                  ))
                            ],
                          ),
                          Text('ทั้งที่เป็นสิทธิความเป็นส่วนตัว\nและสิทธิอื่นๆ',
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.go('/AddMitigatingMeasuresPage');
                                },
                                child: Text('เพิ่ม/แก้ไขมาตรการ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
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
                              Text('ทำให้ไม่สามารถใช้สิทธิได้ตามสมควร',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
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
                                        ?.copyWith(
                                            color: const Color(0xFFAF3232)),
                                  ))
                            ],
                          ),
                          Text('ทั้งที่เป็นสิทธิความเป็นส่วนตัว\nและสิทธิอื่นๆ',
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              'ความเห็นของ DPO : ${mitigatingdescription[index].dpo}',
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              'สถานะการดำเนินการ : ${mitigatingdescription[index].manage}',
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.go('/AddMitigatingMeasuresPage');
                                },
                                child: Text('เพิ่ม/แก้ไขมาตรการ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }
        },
      )
    ];
  }
}
