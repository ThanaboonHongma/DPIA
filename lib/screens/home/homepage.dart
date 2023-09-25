import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:dpia_project/models/home/homedescription.dart';
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
                  context.go('/Identification');
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
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Text(
                          'รายการประเมินDPIA',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Color.fromRGBO(35, 169, 225, 1),
                                  ),
                        ),
                      ),
                    ),
                  ],
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
          context.go('/Identification');
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
                  color: Color.fromRGBO(35, 169, 225, 1),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                context.go('/Identification');
              },
              child: Text(
                'อ่านเพิ่มเติม',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              )),
        ],
      )
    ];
  }

  _dpialistview(DpiaProvider dpiaProvider) {
    final productList = Provider.of<DpiaProvider>(context);
    if (productList.riskAssessments.isEmpty) {
      return [
        Column(
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
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.tertiary),
                          ),
                          onPressed: () {
                            context.go('/Identification');
                          },
                          child: Text(
                            'เริ่มประเมิน DPIA',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          )))
                ],
              ),
            ),
          ],
        ),
      ];
    } else {
      List numhomelength = [];
      numhomelength = dpiaProvider.riskAssessments
        .where((risk) => risk.riskLevel == 'ระดับสูง')
        .toList();
      print(numhomelength.length);
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: numhomelength.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('แบบประเมิน DPIA',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium),
                              Text(
                                '${productList.riskAssessments[index].date.day.toString()}/${productList.riskAssessments[index].date.month.toString()}/${productList.riskAssessments[index].date.year.toString()}',
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
                              Text(
                                  '${numhomelength.length} ความเสี่ยงสูง',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)
                            ],
                          ),
                          Container(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      // ${productList.riskAssessments[index].measures[index].percent.toString()}
                                        'สถานะดำเนินการ : 0 %',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)
                                  ],
                                ),
                              ],
                            ),
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
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ];
    }
  }
}
