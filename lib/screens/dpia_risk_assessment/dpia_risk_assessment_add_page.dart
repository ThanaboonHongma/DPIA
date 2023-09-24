import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:dpia_project/models/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DpiaAddRisk extends StatefulWidget {
  const DpiaAddRisk({super.key});

  @override
  State<DpiaAddRisk> createState() => _DpiaAddRiskState();
}

class _DpiaAddRiskState extends State<DpiaAddRisk> {
  List<RiskData> defaultriskdata = [];

  // This variable tracks whether the modal bottom sheet is open or closed.
  String _probability = "โอกาสต่ำ";
  String _severity = "ร้ายแรงน้อย";
  String _riskLevel = "ระดับต่ำ";

  // Function to toggle the bottom sheet's state.

  void _updateRisk() {
    setState(() {
      // คำนวณระดับความเสี่ยงขึ้นอยู่กับความน่าจะเป็นและความร้ายแรงที่เลือก
      if (_probability == "โอกาสต่ำ" && _severity == "ร้ายแรงน้อย") {
        _riskLevel = "ระดับต่ำ";
      } else if (_probability == "โอกาสต่ำ" && _severity == "ร้ายแรงพอสมควร") {
        _riskLevel = "ระดับต่ำ";
      } else if (_probability == "โอกาสต่ำ" && _severity == "ร้ายแรงมาก") {
        _riskLevel = "ระดับต่ำ";
      } else if (_probability == "โอกาสพอสมควร" && _severity == "ร้ายแรงน้อย") {
        _riskLevel = "ระดับต่ำ";
      } else if (_probability == "โอกาสพอสมควร" &&
          _severity == "ร้ายแรงพอสมควร") {
        _riskLevel = "ระดับกลาง";
      } else if (_probability == "โอกาสพอสมควร" && _severity == "ร้ายแรงมาก") {
        _riskLevel = "ระดับสูง";
      } else if (_probability == "โอกาสสูง" && _severity == "ร้ายแรงน้อย") {
        _riskLevel = "ระดับต่ำ";
      } else if (_probability == "โอกาสสูง" && _severity == "ร้ายแรงพอสมควร") {
        _riskLevel = "ระดับสูง";
      } else if (_probability == "โอกาสสูง" && _severity == "ร้ายแรงมาก") {
        _riskLevel = "ระดับสูง";
      }
    });
  }

  int riskCounter = 1;

  void saveRisk() {
    setState(() {
      defaultriskdata.add((RiskData(
          id: 0,
          effect: _impactTextController.text,
          probability: _probability,
          severity: _severity,
          riskLevel: _riskLevel)));
    });

    // เคลียร์ข้อมูลใน TextField หลังจากเพิ่มความเสี่ยง
    _impactTextController.clear();
  }

  final TextEditingController _impactTextController = TextEditingController();

  @override
  void dispose() {
    _impactTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close)),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: Text(
                  'ความเสี่ยงที่ $riskCounter',
                  style: Theme.of(context).textTheme.titleLarge,
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
                padding: EdgeInsets.only(left: 1.0),
                child: Text(
                  'ผลกระทบ ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: TextField(
                controller: _impactTextController, 
                textAlignVertical:
                    TextAlignVertical.center, 
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.3),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.0),
                child: Text(
                  'ความเสี่ยงเบื้องต้น',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("ความน่าจะเป็น",
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Wrap(
                children: <Widget>[
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("โอกาสต่ำ",
                        style: Theme.of(context).textTheme.titleSmall),
                    value: "โอกาสต่ำ",
                    groupValue: _probability,
                    onChanged: (value) {
                      setState(() {
                        _probability = value!;
                        _updateRisk();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("โอกาสพอสมควร",
                        style: Theme.of(context).textTheme.titleSmall),
                    value: "โอกาสพอสมควร",
                    groupValue: _probability,
                    onChanged: (value) {
                      setState(() {
                        _probability = value!;
                        _updateRisk();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("โอกาสสูง",
                        style: Theme.of(context).textTheme.titleSmall),
                    value: "โอกาสสูง",
                    groupValue: _probability,
                    onChanged: (value) {
                      setState(() {
                        _probability = value!;
                        _updateRisk();
                      });
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("ความร้ายแรง",
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Column(
                children: <Widget>[
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("ร้ายแรงน้อย",
                        style: Theme.of(context).textTheme.titleSmall),
                    value: "ร้ายแรงน้อย",
                    groupValue: _severity,
                    onChanged: (value) {
                      setState(() {
                        _severity = value!;
                        _updateRisk();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("ร้ายแรงพอสมควร",
                        style: Theme.of(context).textTheme.titleSmall),
                    value: "ร้ายแรงพอสมควร",
                    groupValue: _severity,
                    onChanged: (value) {
                      setState(() {
                        _severity = value!;
                        _updateRisk();
                      });
                    },
                  ),
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("ร้ายแรงมาก",
                        style: Theme.of(context).textTheme.titleSmall),
                    value: "ร้ายแรงมาก",
                    groupValue: _severity,
                    onChanged: (value) {
                      setState(() {
                        _severity = value!;
                        _updateRisk();
                      });
                    },
                  ),
                ],
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
                  'ผลการประเมินความเสี่ยง',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16 , bottom: 16),
              child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // จัดการชิดขวาและซ้าย
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                              2.0), // ความห่างระหว่าง Container แต่ละตัว (2 ความหนา)
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffA2EDCE),
                              border: _riskLevel == "ระดับต่ำ"
                                  ? Border.all(
                                      color: Color(0xff00FF96), width: 2)
                                  : null,
                            ),
                            child: Center(
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "ระดับต่ำ",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffEDCFA2),
                                border: _riskLevel == "ระดับกลาง"
                                    ? Border.all(
                                        color: Color(0xffFF8700), width: 2)
                                    : null,
                              ),
                              child: Center(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "ระดับกลาง",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFA8B8),
                              border: _riskLevel == "ระดับสูง"
                                  ? Border.all(
                                      color: Color(0xffFF0000), width: 2)
                                  : null,
                            ),
                            child: Center(
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "ระดับสูง",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                final productList =
                    Provider.of<CounterProvider>(context, listen: false);
                productList.saveRisk(RiskData(
                    id: riskCounter,
                    effect: _impactTextController.text,
                    probability: _probability,
                    severity: _severity,
                    riskLevel: _riskLevel));
                counterProvider.toggleBottomSheet(true);
              },
              child: const Text('บันทึกความเสี่ยง'),
            ),
          ],
        ),
      ),
    );
  }
}
