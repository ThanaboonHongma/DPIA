import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:flutter/material.dart';

class DpiaProvider extends ChangeNotifier {
  List _dpiaAssessments = [];
  List<RiskData> _riskAssessments = [];

  List get dpiaAssessments => _dpiaAssessments;
  List<RiskData> get riskAssessments => _riskAssessments;

  void saveRiskAssessment(RiskData riskdata) {
    final index = _riskAssessments.indexWhere((risk) => risk.id == riskdata.id);
    if (index != -1) {
      _riskAssessments[index] = riskdata;
    } else {
      _riskAssessments.add(riskdata);
    }

    notifyListeners();
  }

  void saveRiskHighLevel(RiskData riskData) {
    List<RiskData> temp = [];

    for (RiskData risk in _riskAssessments) {
      if (risk.id == riskData.id) {
        temp.add(riskData);
      } else {
        temp.add(risk);
      }
    }
    _riskAssessments = temp;
    notifyListeners();
  }

  void saveRiskAssessmentToDPIAlist(){
    _dpiaAssessments = _riskAssessments;
    print('List DPIA : ${_dpiaAssessments.first.hashCode}');
  }
}
