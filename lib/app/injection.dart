import 'package:flutter_application_1/app/database/mysql/myqsl_dao.dart';
// import 'package:flutter_application_1/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter_application_1/app/domain/interfaces/app_dao.dart';
import 'package:flutter_application_1/app/domain/services/app_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDao>(ContactDAOMySQL());
  getIt.registerSingleton<ContactService>(ContactService());
}
