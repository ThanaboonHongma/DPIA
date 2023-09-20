import 'package:dpia_project/models/home/homedescription.dart';
import 'package:dpia_project/screens/dpia-Identification/Identification1.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Identification1(),
                    ),
                  );
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ..._dpiais(),
                  const SizedBox(
                    height: 25,
                  ),
                  ..._dpialistview(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Identification1(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _dpiais() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 360,
          height: 220,
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
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'DPIA',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    'คือ การประเมินผลกระทบด้านความเป็นส่วนตัว (privacy impact assessment) หรือ “การประเมินผลกระทบด้านการคุ้มครองข้อมูลส่วนบุคคล”(data protection impact assessment, DPIA) เป็นเครื่องมือสำคัญที่จะช่วยให้องค์กรสามารถบริหารการจัดการความเสี่ยงด้านข้อมูลส่วนบุคคล (privacy risk) ได้อย่างเป็นระบบและเป็นรูปธรรม',
                    style: Theme.of(context).textTheme.bodyMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Identification1(),
                            ),
                          );
                        },
                        child: Text(
                          'อ่านเพิ่มเติม',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ];
  }

  _dpialistview() {
    if (homedescription.isEmpty) {
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
            Container(
              width: 360,
              height: 150,
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
              child: Center(
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
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const Identification1(),
                                ),
                              );
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
            ),
          ],
        ),
      ];
    } else {
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
              itemCount: homedescription.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: homedescription[index].manage == '' ? 90 : 115,
                      width: 360,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(homedescription[index].titel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Text(
                                  homedescription[index].datetime,
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
                                Text(homedescription[index].rick,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium)
                              ],
                            ),
                            Container(
                                child: homedescription[index].manage == ''
                                    ? null
                                    : Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  homedescription[index].manage,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium)
                                            ],
                                          ),
                                        ],
                                      )),
                          ],
                        ),
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
