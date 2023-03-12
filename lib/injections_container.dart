import 'package:clean_arch_linkedin/features/auth/data/dataSources/auth_data_source.dart';
import 'package:clean_arch_linkedin/features/auth/data/repository/aut_repo_imp.dart';
import 'package:clean_arch_linkedin/features/auth/domain/repository/auth_repo.dart';
import 'package:clean_arch_linkedin/features/auth/domain/usecases/change_pro_img.dart';
import 'package:clean_arch_linkedin/features/auth/domain/usecases/login_user.dart';
import 'package:clean_arch_linkedin/features/auth/domain/usecases/register_user.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_linkedin/features/post/data/dataSources/post_dataSource.dart';
import 'package:clean_arch_linkedin/features/post/data/repository/post_repo_imp.dart';
import 'package:clean_arch_linkedin/features/post/domain/repository/post_repo.dart';
import 'package:clean_arch_linkedin/features/post/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/post/domain/usecases/create_post.dart';
import 'features/post/domain/usecases/get_all_posts.dart';

final serviceLocator = GetIt.instance;

//await return future<void> shareprefes
void init() {
  //----------------------------features
  //bloc
  serviceLocator.registerFactory(
    () => AuthBloc(
      changeProImg: serviceLocator.call(),
      loginUserUsecase: serviceLocator(),
      registerUser: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => PostBloc(
      createPostUseCase: serviceLocator(),
      getAllPost: serviceLocator(),
    ),
  );

  //useCases
  serviceLocator
      .registerLazySingleton(() => ChangeProImg(repository: serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => LoginUser(repository: serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => RegisterUser(repository: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => CreatePostUseCase(postRepository: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => GetAllPost(postRepository: serviceLocator()));

  //repository
  serviceLocator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(authDataSource: serviceLocator()));

  serviceLocator.registerLazySingleton<PostRepo>(
      () => PostRepoImp(postDataSource: serviceLocator()));

  // data sources

  serviceLocator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImp(client: serviceLocator()));

  serviceLocator.registerLazySingleton<PostDataSource>(
      () => PostDataSourceImp(client: serviceLocator()));

  //-----------------------------core

  //--------------------- external dependencies
  serviceLocator.registerLazySingleton(() => http.Client());
}
