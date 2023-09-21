import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  final bool _isBottomSheetOpen = false;
  final int _id = 0;
  final String _effect = '';
  final String _probability = '';
  final String _severity = '';
  final String _riskLevel = '';
  List<RiskData> _risklist = [];
  List<RiskData> _rickdatahigh = [];

  List<RiskData> get risklist => _risklist;
  List<RiskData> get rickdatahigh => _rickdatahigh;

  bool get isBottomSheetOpen => _isBottomSheetOpen;
  int get id => _id;
  String get effect => _effect;
  String get probability => _probability;
  String get severity => _severity;
  String get riskLevel => _riskLevel;

  void saveRisk(RiskData riskdata) {
    final index = _risklist.indexWhere((risk) => risk.id == riskdata.id);
    if (index != -1) {
      _risklist[index] = riskdata;
    } else {
      _risklist.add(riskdata);
    }
    notifyListeners();
  }

  void saveRiskData(RiskData riskdata) {
    List<RiskData> temp = [];
    for (RiskData i in _risklist) {
      if (i.id == riskdata.id) {
        // print(i.measures.first.dpo);
        // print(riskdata.measures.first.dpo);
        temp.add(riskdata);
      } else {
        temp.add(i);
      }
    }
    _risklist = temp;
    notifyListeners();
  }

  void setrickhigh(){
    _rickdatahigh = risklist.where((risk) => risk.riskLevel == 'ระดับสูง').toList();
    print('========>!!${_rickdatahigh.first.id}');
    notifyListeners();
  }
}
