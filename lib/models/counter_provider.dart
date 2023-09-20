import 'package:dpia_project/models/riskassessment/risklist.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  bool _isBottomSheetOpen = false;
  final int _id = 0;
  final String _effect = '';
  final String _probability = '';
  final String _severity = '';
  final String _riskLevel = '';
  final List<RiskData> _risklist = [];

  List<RiskData> get risklist => _risklist;
  bool get isBottomSheetOpen => _isBottomSheetOpen;
  int get id => _id;
  String get effect => _effect;
  String get probability => _probability;
  String get severity => _severity;
  String get riskLevel => _riskLevel;

  void toggleBottomSheet(bool newDAta) {
    _isBottomSheetOpen = newDAta;
    notifyListeners();
  }

  void saveRisk(RiskData rickdata) {
    _risklist.add(rickdata);
    notifyListeners();
  }
}

List<CounterProvider> defaultriskdata = [];
