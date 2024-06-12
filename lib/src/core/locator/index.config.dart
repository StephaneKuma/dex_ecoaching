// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_coaching/src/core/commons/cubits/app_user/app_user_cubit.dart'
    as _i3;
import 'package:e_coaching/src/core/locator/modules.dart' as _i13;
import 'package:e_coaching/src/core/services/validador.dart' as _i5;
import 'package:e_coaching/src/features/authentication/data/datasources/authentication_remote_datasource.dart'
    as _i6;
import 'package:e_coaching/src/features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i8;
import 'package:e_coaching/src/features/authentication/domain/repositories/authentication_repository.dart'
    as _i7;
import 'package:e_coaching/src/features/authentication/domain/usecases/current_user.dart'
    as _i9;
import 'package:e_coaching/src/features/authentication/domain/usecases/user_sign_in.dart'
    as _i10;
import 'package:e_coaching/src/features/authentication/domain/usecases/user_sign_up.dart'
    as _i11;
import 'package:e_coaching/src/features/authentication/presentation/bloc/authentication_bloc.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:supabase_flutter/supabase_flutter.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    gh.lazySingleton<_i3.AppUserCubit>(() => _i3.AppUserCubit());
    gh.lazySingleton<_i4.SupabaseClient>(() => modules.supabase);
    gh.lazySingleton<_i5.Validador>(() => _i5.Validador());
    gh.lazySingleton<_i6.AuthenticationRemoteDatasource>(() =>
        _i6.AuthenticationRemoteDatasourceImpl(
            client: gh<_i4.SupabaseClient>()));
    gh.lazySingleton<_i7.AuthenticationRepository>(() =>
        _i8.AuthenticationRepositoryImpl(
            remoteDatasource: gh<_i6.AuthenticationRemoteDatasource>()));
    gh.lazySingleton<_i9.CurrentUser>(
        () => _i9.CurrentUser(repository: gh<_i7.AuthenticationRepository>()));
    gh.lazySingleton<_i10.UserSignIn>(
        () => _i10.UserSignIn(repository: gh<_i7.AuthenticationRepository>()));
    gh.lazySingleton<_i11.UserSignUp>(
        () => _i11.UserSignUp(repository: gh<_i7.AuthenticationRepository>()));
    gh.lazySingleton<_i12.AuthenticationBloc>(() => _i12.AuthenticationBloc(
          signUp: gh<_i11.UserSignUp>(),
          signIn: gh<_i10.UserSignIn>(),
          currentUser: gh<_i9.CurrentUser>(),
          userCubit: gh<_i3.AppUserCubit>(),
        ));
    return this;
  }
}

class _$Modules extends _i13.Modules {}
