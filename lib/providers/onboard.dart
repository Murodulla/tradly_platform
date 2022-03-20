import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardProvider extends ChangeNotifier {
  bool lastPage = false;

  void toLastPage(bool isLastPage) {
    lastPage = isLastPage;
    notifyListeners();
  }

  Future<void> saveOnboardingState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_launched', true);
    notifyListeners();
  }
}
