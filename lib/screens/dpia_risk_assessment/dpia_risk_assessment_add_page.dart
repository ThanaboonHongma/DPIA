import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:dpia_project/providers/dpia_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class DpiaAddRisk extends StatefulWidget {
  const DpiaAddRisk({super.key});

  @override
  State<DpiaAddRisk> createState() => _DpiaAddRiskState();
}

class _DpiaAddRiskState extends State<DpiaAddRisk> {
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

  final TextEditingController _impactTextController = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _impactTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dpiaProvider = Provider.of<DpiaProvider>(context, listen: false);
    DateTime selectedDate = DateTime.now();

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
                  'ความเสี่ยงที่ ${dpiaProvider.riskAssessments.length + 1}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.44),
              thickness: 1,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: Text(
                  'ผลกระทบ ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _impactTextController, // กำหนด Controller
                onChanged: (String value) {
                  setState(() {
                    _errorText = null;
                  });
                },
                textAlignVertical:
                    TextAlignVertical.center, // กำหนดการจัดวางแนวดิ่งเป็นกลาง
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _errorText,
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
                  'ความเสี่ยงเบื้องต้น',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.44),
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    ListTile(
                      title: Text("ความน่าจะเป็น",
                          style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Wrap(
                        children: <Widget>[
                          RadioListTile(
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
                  ],
                ),
                ListTile(
                  title: Text("ความร้ายแรง",
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Column(
                    children: <Widget>[
                      RadioListTile(
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
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // จัดการชิดขวาและซ้าย
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  2.0), // ความห่างระหว่าง Container แต่ละตัว (2 ความหนา)
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _riskLevel == "ระดับต่ำ"
                                      ? const Color(0xffA2EDCE)
                                      : const Color(0xffA2EDCE).withOpacity(0.3),
                                  border: _riskLevel == "ระดับต่ำ"
                                      ? Border.all(
                                          color: const Color.fromARGB(255, 0, 70, 42),
                                          width: 2)
                                      : null,
                                ),
                                child: const Center(
                                  child: Padding(
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
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _riskLevel == "ระดับกลาง"
                                        ? const Color(0xffEDCFA2)
                                        : const Color(0xffEDCFA2).withOpacity(0.3),
                                    border: _riskLevel == "ระดับกลาง"
                                        ? Border.all(
                                            color:
                                                const Color.fromARGB(255, 82, 44, 0),
                                            width: 2)
                                        : null,
                                  ),
                                  child: const Center(
                                    child: Padding(
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
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _riskLevel == "ระดับสูง"
                                      ? const Color(0xffFFA8B8)
                                      : const Color(0xffFFA8B8).withOpacity(0.3),
                                  border: _riskLevel == "ระดับสูง"
                                      ? Border.all(
                                          color: const Color.fromARGB(255, 102, 0, 0),
                                          width: 2)
                                      : null,
                                ),
                                child: const Center(
                                  child: Padding(
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
                Divider(
                  color: Colors.black.withOpacity(0.44),
                  thickness: 1,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_impactTextController.text.isEmpty) {
                        setState(() {
                          _errorText = 'กรุณากรอกผลกระทบ'; // Set error message
                        });
                      } else {
                        Navigator.pop(context);
                        dpiaProvider.saveRiskAssessment(
                          RiskData(
                            id: const Uuid().v4(),
                            effect: _impactTextController.text,
                            probability: _probability,
                            date: selectedDate,
                            severity: _severity,
                            riskLevel: _riskLevel,
                            measures: [],
                          ),
                        );
                      }
                    },
                    child: const Text('บันทึกความเสี่ยง'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
