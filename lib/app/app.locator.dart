// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../config/network/network_client.dart';
import '../features/login/data/datasource/auth_datasource.dart';
import '../features/login/data/repository/auth_respository_impl.dart';
import '../features/login/domain/repository/auth_repository.dart';
import '../features/login/domain/usecases/login_usecase.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton(NetworkUtil());
  locator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(locator()));
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRespositoryImpl(authDataSource: locator()));
  locator.registerLazySingleton(() => LoginUseCase(locator()));
}
