import 'package:tost_test_code/app/app.bottomsheets.dart';
import 'package:tost_test_code/app/app.dialogs.dart';
import 'package:tost_test_code/app/app.locator.dart';
import 'package:tost_test_code/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future goToHomeView() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    // _navigationService.replaceWithHomeView();
  }
}
