import 'package:eshop/data/data_sources/local/cart_local_data_source.dart';
import 'package:eshop/data/data_sources/local/category_local_data_source.dart';
import 'package:eshop/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:eshop/data/data_sources/remote/category_remote_data_source.dart';
import 'package:eshop/data/data_sources/remote/delivery_info_remote_data_source.dart';
import 'package:eshop/data/repositories/cart_repository_impl.dart';
import 'package:eshop/data/repositories/category_repository_impl.dart';
import 'package:eshop/data/repositories/delivery_info_impl.dart';
import 'package:eshop/data/repositories/user_repository_impl.dart';
import 'package:eshop/domain/repositories/cart_repository.dart';
import 'package:eshop/domain/repositories/category_repository.dart';
import 'package:eshop/domain/repositories/delivery_info_repository.dart';
import 'package:eshop/domain/repositories/user_repository.dart';
import 'package:eshop/domain/usecases/cart/add_cart_item_usecase.dart';
import 'package:eshop/domain/usecases/cart/get_cached_cart_usecase.dart';
import 'package:eshop/domain/usecases/cart/get_remote_cart_usecase.dart';
import 'package:eshop/domain/usecases/cart/sync_cart_usecase.dart';
import 'package:eshop/domain/usecases/category/filter_category_usecase.dart';
import 'package:eshop/domain/usecases/category/get_remote_category_usecase.dart';
import 'package:eshop/domain/usecases/delivery_info/add_dilivey_info_usecase.dart';
import 'package:eshop/domain/usecases/delivery_info/get_delivery_info_usecase.dart';
import 'package:eshop/domain/usecases/user/get_cached_user_usecase.dart';
import 'package:eshop/domain/usecases/user/sign_in_usecase.dart';
import 'package:eshop/domain/usecases/user/sign_out_usecase.dart';
import 'package:eshop/domain/usecases/user/sign_up_usecase.dart';
import 'package:eshop/presentation/blocs/cart/cart_bloc.dart';
import 'package:eshop/presentation/blocs/category/category_bloc.dart';
import 'package:eshop/presentation/blocs/delivery_info/delivery_info_add/delivery_info_add_cubit.dart';
import 'package:eshop/presentation/blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import 'package:eshop/presentation/blocs/user/user_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_sources/local/product_local_data_source.dart';
import '../../data/data_sources/local/user_local_data_source.dart';
import '../../data/data_sources/remote/product_remote_data_source.dart';
import '../../data/data_sources/remote/user_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/category/get_cached_category_usecase.dart';
import '../../domain/usecases/product/get_product_usecase.dart';
import '../../presentation/blocs/product/product_bloc.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features - Product
  // Bloc
  sl.registerFactory(
    () => ProductBloc(sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetProductUseCase(sl()));
  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - Category
  // Bloc
  sl.registerFactory(
    () => CategoryBloc(sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRemoteCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedCategoryUseCase(sl()));
  sl.registerLazySingleton(() => FilterCategoryUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CategoryLocalDataSource>(
    () => CategoryLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - Cart
  // Bloc
  sl.registerFactory(
    () => CartBloc(sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedCartUseCase(sl()));
  sl.registerLazySingleton(() => GetRemoteCartUseCase(sl()));
  sl.registerLazySingleton(() => AddCartUseCase(sl()));
  sl.registerLazySingleton(() => SyncCartUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - Delivery Info
  // Bloc
  sl.registerFactory(
    () => DeliveryInfoAddCubit(sl()),
  );
  sl.registerFactory(
    () => DeliveryInfoFetchCubit(sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => AddDeliveryInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetDeliveryInfoUseCase(sl()));
  // Repository
  sl.registerLazySingleton<DeliveryInfoRepository>(
    () => DeliveryInfoRepositoryImpl(
      remoteDataSource: sl(),
      // localDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<DeliveryInfoRemoteDataSource>(
    () => DeliveryInfoRemoteDataSourceImpl(client: sl()),
  );

  //Features - User
  // Bloc
  sl.registerFactory(
    () => UserBloc(sl(), sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  ///***********************************************
  ///! Core
  /// sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
