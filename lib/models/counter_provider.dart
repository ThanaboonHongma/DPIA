import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  List<RiskData> _risklist = [];
  List<RiskData> _rickdatahigh = [];

  List<RiskData> get risklist => _risklist;
  List<RiskData> get rickdatahigh => _rickdatahigh;

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
    final index = _risklist.indexWhere((i) => i.id == riskdata.id);
    if (index != -1) {
      _risklist[index] = riskdata;
    } else {
      _risklist.add(riskdata);
    }
    _risklist = _risklist..sort((a,b)=> a.createdAt.compareTo(b.createdAt));
    notifyListeners();
  }

  void setrickhigh(){
    _rickdatahigh = risklist.where((risk) => risk.riskLevel == 'ระดับสูง').toList();
    print('========>!!${_rickdatahigh.first.id}');
    notifyListeners();
  }
}
