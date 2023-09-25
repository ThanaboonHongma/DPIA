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
                ),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.44),
              thickness: 1,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.0),
                child: Text(
                  'ผลกระทบ ',
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: TextField(
                controller: _impactTextController, // กำหนด Controller
                textAlignVertical:
                    TextAlignVertical.center, // กำหนดการจัดวางแนวดิ่งเป็นกลาง
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.0),
                child: Text(
                  'ความเสี่ยงเบื้องต้น',
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
                      title: const Text("ความน่าจะเป็น"),
                      subtitle: Wrap(
                        children: <Widget>[
                          RadioListTile(
                            title: const Text("โอกาสต่ำ"),
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
                            title: const Text("โอกาสพอสมควร"),
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
                            title: const Text("โอกาสสูง"),
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
                  title: const Text("ความร้ายแรง"),
                  subtitle: Column(
                    children: <Widget>[
                      RadioListTile(
                        title: const Text("ร้ายแรงน้อย"),
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
                        title: const Text("ร้ายแรงพอสมควร"),
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
                        title: const Text("ร้ายแรงมาก"),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 16,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _riskLevel == "ระดับต่ำ"
                              ? const Color(0xffA2EDCE)
                              : const Color(0xffA2EDCE).withOpacity(0.3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "ระดับต่ำ",
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _riskLevel == "ระดับกลาง"
                              ? const Color(0xffEDCFA2)
                              : const Color(0xffEDCFA2).withOpacity(0.3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "ระดับกลาง",
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _riskLevel == "ระดับสูง"
                              ? const Color(0xffFFA8B8)
                              : const Color(0xffFFA8B8).withOpacity(0.3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "ระดับสูง",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.44),
                  thickness: 1,
                ),
                ElevatedButton(
                  onPressed: () {
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
                  },
                  child: const Text('บันทึกความเสี่ยง'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
