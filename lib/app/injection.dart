import 'package:flutter_application_1/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter_application_1/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDao>(ContactDAOimpl());
}
