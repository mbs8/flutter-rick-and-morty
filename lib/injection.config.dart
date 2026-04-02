// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty/character/data/character_repository.dart'
    as _i397;
import 'package:rick_and_morty/character/data/service/character_service.dart'
    as _i164;
import 'package:rick_and_morty/character/domain/character_interactor.dart'
    as _i32;
import 'package:rick_and_morty/character/presentation/bloc/character_bloc.dart'
    as _i823;
import 'package:rick_and_morty/details/data/details_repository.dart' as _i856;
import 'package:rick_and_morty/details/data/service/character_details_service.dart'
    as _i1063;
import 'package:rick_and_morty/details/presentation/bloc/character_details_bloc.dart'
    as _i1017;
import 'package:rick_and_morty/network/network_module.dart' as _i626;
import 'package:rick_and_morty/preferences/preferences_module.dart' as _i278;
import 'package:rick_and_morty/shared/theme/data/app_theme_repository.dart'
    as _i834;
import 'package:rick_and_morty/shared/theme/data/cubit/theme_cubit.dart'
    as _i812;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final preferencesModule = _$PreferencesModule();
  final networkModule = _$NetworkModule();
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => preferencesModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i834.AppThemeRepository>(
      () => _i834.AppThemeRepositoryImpl(gh<_i460.SharedPreferences>()));
  gh.factory<_i361.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.singleton<_i361.Dio>(() => networkModule.provideDio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<_i361.Interceptor>(instanceName: 'PrettyLogger'),
      ));
  gh.factory<_i812.ThemeCubit>(
      () => _i812.ThemeCubit(gh<_i834.AppThemeRepository>()));
  gh.factory<_i164.CharacterService>(
      () => _i164.CharacterServiceImpl(gh<_i361.Dio>()));
  gh.factory<_i1063.CharacterDetailsService>(
      () => _i1063.CharacterDetailsServiceImpl(gh<_i361.Dio>()));
  gh.factory<_i856.CharacterDetailsRepository>(() =>
      _i856.CharacterDetailsRepositoryImpl(
          gh<_i1063.CharacterDetailsService>()));
  gh.factory<_i397.CharacterRepository>(
      () => _i397.CharacterRepositoryImpl(gh<_i164.CharacterService>()));
  gh.factory<_i1017.CharacterDetailsBloc>(() =>
      _i1017.CharacterDetailsBloc(gh<_i856.CharacterDetailsRepository>()));
  gh.factory<_i32.CharacterInteractor>(
      () => _i32.CharacterInteractorImpl(gh<_i397.CharacterRepository>()));
  gh.factory<_i823.CharacterBloc>(
      () => _i823.CharacterBloc(gh<_i32.CharacterInteractor>()));
  return getIt;
}

class _$PreferencesModule extends _i278.PreferencesModule {}

class _$NetworkModule extends _i626.NetworkModule {}
