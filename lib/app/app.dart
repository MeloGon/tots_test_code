import 'package:tost_test_code/config/network/network_client.dart';
import 'package:tost_test_code/features/home/data/datasource/home_datasource.dart';
import 'package:tost_test_code/features/home/data/repository/home_repository_impl.dart';
import 'package:tost_test_code/features/home/domain/repository/home_repository.dart';
import 'package:tost_test_code/features/home/domain/usecases/add_client_usecase.dart';
import 'package:tost_test_code/features/home/domain/usecases/get_clients_usecase.dart';
import 'package:tost_test_code/features/home/presentation/views/home_view.dart';
import 'package:tost_test_code/features/login/data/datasource/auth_datasource.dart';
import 'package:tost_test_code/features/login/data/repository/auth_respository_impl.dart';
import 'package:tost_test_code/features/login/domain/repository/auth_repository.dart';
import 'package:tost_test_code/features/login/domain/usecases/login_usecase.dart';
import 'package:tost_test_code/features/login/presentation/views/login_view.dart';
import 'package:tost_test_code/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tost_test_code/ui/dialogs/add_client_alert/add_client_dialog.dart';
import 'package:tost_test_code/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tost_test_code/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

//import 'package:tost_test_code/ui/views/login/login_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: NetworkUtil),
    LazySingleton(
      classType: AuthDataSourceImpl,
      asType: AuthDataSource,
    ),
    LazySingleton(
      classType: AuthRespositoryImpl,
      asType: AuthRepository,
    ),
    LazySingleton(
      classType: HomeDataSourceImpl,
      asType: HomeDataSource,
    ),
    LazySingleton(
      classType: HomeRepositoryImpl,
      asType: HomeRepository,
    ),
    LazySingleton(classType: LoginUseCase),
    LazySingleton(classType: GetClientsUsecase),
    LazySingleton(classType: AddClientUsecase)

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: AddClientDialog),
    // @stacked-dialog
  ],
)
class App {}
