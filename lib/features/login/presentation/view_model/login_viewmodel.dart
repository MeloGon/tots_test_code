import 'package:shared_preferences/shared_preferences.dart';
import 'package:tost_test_code/app/app.dialogs.dart';
import 'package:tost_test_code/app/app.locator.dart';
import 'package:tost_test_code/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tost_test_code/features/login/data/models/login_req_params.dart';
import 'package:tost_test_code/features/login/domain/usecases/login_usecase.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginUseCase = locator<LoginUseCase>();
  final _dialogService = locator<DialogService>();

  Future goToHomeView() async {
    _navigationService.replaceWithHomeView();
  }

  Future login(LoginReqParams loginReq) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //goToHomeView();
    await _loginUseCase
        .call(
      LoginReqParams(mail: loginReq.mail, password: loginReq.password),
    )
        .then((response) {
      prefs.setString('token', response.accessToken);
      goToHomeView();
    }).catchError((error) {
      _showDialogSomethingHappened();
    });
  }

  void _showDialogSomethingHappened() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Ups',
      description: 'There is a problem',
    );
  }
}
