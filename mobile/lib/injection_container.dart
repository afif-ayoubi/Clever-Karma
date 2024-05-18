import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile/core/common_domain/repository/base_repository.dart';
import 'package:mobile/core/network/network_info.dart';
import 'package:mobile/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:mobile/features/auth/domain/entities/user.dart';
import 'package:mobile/features/auth/domain/repositories/user_repository.dart';
import 'package:mobile/features/auth/domain/usecases/create_user.dart';
import 'package:mobile/features/auth/domain/usecases/get_user.dart';
import 'package:mobile/features/auth/domain/usecases/login_user.dart';
import 'package:mobile/features/auth/domain/usecases/logout_user.dart';
import 'package:mobile/features/auth/domain/usecases/update_user.dart';
import 'package:mobile/features/auth/presentation/bloc/users/users_bloc.dart';
import 'package:mobile/features/opportunity/data/models/opportunity_model.dart';
import 'package:mobile/features/opportunity/data/repositories/opportunity_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/constants.dart';
import 'features/auth/data/datasources/user_local_data_source.dart';
import 'features/auth/data/models/user_model.dart';
import 'features/auth/data/repositories/user_repository_impl.dart';
import 'package:http/http.dart' as http;

import 'features/opportunity/domain/entities/opportunity.dart';
import 'features/opportunity/domain/repositories/opportunity_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Users

  // Bloc

  sl.registerFactory(() => UsersBloc(
      createUserUseCase: sl(),
      getUserUseCase: sl(),
      loginUserUseCase: sl(),
      logoutUserUseCase: sl(),
      updateUserUseCase: sl()));

  // UseCases

  sl.registerLazySingleton(() => CreateUserUseCase(sl()));
  sl.registerLazySingleton(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUserUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<BaseRepository>(() => UsersRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<BaseRepository<User>>(() => UsersRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<BaseRepository<Opportunity>>(
      () => OpportunityRepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<OpportunityRepository>(
      () => OpportunityRepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkInfo: sl(),
          ));

  //DataSources

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(userBox: sl()));

  //! core

  sl.registerLazySingleton<NetworkInfo>(() => NetwerkInfoImpl(sl()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  final userBox = await Hive.openBox<UserModel>(USER_BOX);
  final opportunityBox = await Hive.openBox<OpportunityModel>(OPPORTUNITY_BOX);
  sl.registerLazySingleton(() => userBox);
  sl.registerLazySingleton(() => opportunityBox);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerFactory(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
