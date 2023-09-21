import 'package:dpia_project/models/counter_provider.dart';
// import 'package:dpia_project/models/mitigatingdescription/mitigatingdescription.dart';
import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class AddMeasure extends StatefulWidget {
  final String id;
  const AddMeasure({super.key, required this.id});

  @override
  State<AddMeasure> createState() => _AddMeasureState();
}

class _AddMeasureState extends State<AddMeasure> {
  DateTime selectedDate = DateTime.now();
  List<bool> dpoagree = [false, false];
  List<bool> listenagree = [false, false];
  String _checkdpo = '';
  String _checkresults = '';
  final TextEditingController measures1 = TextEditingController();
  final TextEditingController measures2 = TextEditingController();
  final TextEditingController measures3 = TextEditingController();
  final TextEditingController project = TextEditingController();
  final TextEditingController responsible = TextEditingController();
  final TextEditingController rick1 = TextEditingController();
  final TextEditingController rick2 = TextEditingController();
  final TextEditingController rick3 = TextEditingController();
  final int _checkmanage = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<RiskData> defaultriskdata = [];

  void _updateDPO() {
    if (dpoagree[0] == true) {
      _checkdpo = 'เห็นด้วย';
    } else if (dpoagree[1] == true) {
      _checkdpo = 'ไม่เห็นด้วย';
    }
  }

  void _updateresults() {
    if (listenagree[0] == true) {
      _checkresults = 'เห็นด้วย';
    } else if (listenagree[1] == true) {
      _checkresults = 'ไม่เห็นด้วย';
    }
  }

  void saveDPO() {
    setState(() {
      defaultriskdata.add(Measure(
          measure1: measures1.toString(),
          measure2: measures2.toString(),
          measure3: measures3.toString(),
          project: project.toString(),
          date: selectedDate,
          responsible: responsible.toString(),
          rick1: rick1.toString(),
          rick2: rick2.toString(),
          rick3: rick3.toString(),
          dpo: _checkdpo,
          results: _checkresults) as RiskData);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('=========${widget.id}');
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
              context.go('/MitigatingMeasuresPage');
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(13),
              child: SizedBox(
                width: 70,
                child: ElevatedButton(
                  onPressed: () {
                    final riskData = context
                        .read<CounterProvider>()
                        .risklist
                        .where((risk) => risk.id == widget.id)
                        .first;
                    print('=====>>>>${riskData.id}');
                    
                    context.go('/MitigatingMeasuresPage');
                    context
                        .read<CounterProvider>()
                        .saveRiskData(riskData.copyWith(measures: [
                          Measure(
                            measure1: measures1.toString(),
                            measure2: measures2.toString(),
                            measure3: measures3.toString(),
                            project: project.toString(),
                            date: selectedDate,
                            responsible: responsible.toString(),
                            rick1: rick1.toString(),
                            rick2: rick2.toString(),
                            rick3: rick3.toString(),
                            dpo: _checkdpo,
                            results: _checkresults,
                          )
                        ]));

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
                    'บันทึก',
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
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
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
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child: Text(
                                        'Documentation and Planning',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
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
                                        '[Documentation and Planning]',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
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
                                        'บันทึกรายละเอียดของแต่ละขั้นตอนที่ผ่านมาข้างต้น โดยระบุว่าความเสี่ยงบางกรณีอยู่ในระดับที่ยอมรับได้โดยควรควรปรึกษาหารือกับ DPO ว่าการดำเนินการตามแผนที่สรุปมาเป็นไปตามนโยบายการคุ้มครองข้อมูลส่วนบุคคลหรือไม่',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('ทำให้ไม่สามารถใช้สิทธิได้ตามสมควร',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    Container(
                                        width: 80,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xffFFA8B8),
                                        ),
                                        child: Text(
                                          'ระดับสูง',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFFAF3232)),
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        'ทั้งที่เป็นสิทธิความเป็นส่วนตัว\nและสิทธิอื่นๆ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                                Row(
                                  children: [
                                    Text('สถานะการดำเนินการ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                LinearPercentIndicator(
                                  center: Text('$_checkmanage %',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary)),
                                  barRadius: const Radius.circular(30),
                                  lineHeight: 30,
                                  percent: _checkmanage / 10,
                                  progressColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  backgroundColor: const Color(0xFF7CC4FF),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
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
                                  children: [
                                    Text('มาตรการที่เสนอดำเนินการ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            )),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'มาตรการที่ 1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        height: 40,
                                        width: double.infinity,
                                        child: TextField(
                                          controller: measures1,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'มาตรการที่ 2',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        height: 40,
                                        width: double.infinity,
                                        child: TextField(
                                          controller: measures2,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'มาตรการที่ 3',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        height: 40,
                                        width: double.infinity,
                                        child: TextField(
                                          controller: measures3,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ชื่อโครงการ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        height: 40,
                                        width: double.infinity,
                                        child: TextField(
                                          controller: project,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ตั้งแต่วันที่',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            side: const BorderSide(
                                                color: Colors.grey),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                        onPressed: () => _selectDate(context),
                                        child: SizedBox(
                                          width: 130,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                                                    .split(' ')[0],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                              const Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.blue,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ผู้รับผิดชอบคือ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        height: 40,
                                        width: double.infinity,
                                        child: TextField(
                                          controller: responsible,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text('ความเสี่ยงที่เหลืออยู่',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            )),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ความเสี่ยงที่ 1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: double.infinity,
                                      child: TextField(
                                        controller: rick1,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'ความเสี่ยงที่ 2',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: double.infinity,
                                      child: TextField(
                                        controller: rick2,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'ความเสี่ยงที่ 3',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: double.infinity,
                                      child: TextField(
                                        controller: rick3,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text('ความเห็นของ DPO :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: CheckboxListTile(
                                            title: const Text('เห็นด้วย'),
                                            value: dpoagree[0],
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                dpoagree[0] = newValue!;
                                                dpoagree[1] = false;
                                                _updateDPO();
                                              });
                                            },
                                            activeColor: Colors.blue,
                                            checkColor: Colors.white,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: CheckboxListTile(
                                            title: const Text('ไม่เห็นด้วย'),
                                            value: dpoagree[1],
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                dpoagree[1] = newValue!;
                                                dpoagree[0] = false;
                                                _updateDPO();
                                              });
                                            },
                                            activeColor: Colors.blue,
                                            checkColor: Colors.white,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const TextField(
                                      maxLines: 8,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        'ผลจากการปรึกษาหารือและรับฟังความเห็น :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: CheckboxListTile(
                                            title: const Text('เห็นด้วย'),
                                            value: listenagree[0],
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                listenagree[0] = newValue!;
                                                listenagree[1] =
                                                    false;
                                                _updateresults();
                                              });
                                            },
                                            activeColor: Colors.blue,
                                            checkColor: Colors.white,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: CheckboxListTile(
                                            title: const Text('ไม่เห็นด้วย'),
                                            value: listenagree[1],
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                listenagree[1] = newValue!;
                                                listenagree[0] = false;
                                                _updateresults();
                                              });
                                            },
                                            activeColor: Colors.blue,
                                            checkColor: Colors.white,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const TextField(
                                      maxLines: 8,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
