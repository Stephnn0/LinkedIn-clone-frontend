import 'package:clean_arch_linkedin/core/useCases/login_user_core.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_arch_linkedin/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/storage/storage.dart';
import '../../../../core/useCases/change_img_prof.dart';
import '../../../../core/useCases/register_user.dart';
import '../../domain/usecases/change_pro_img.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ChangeProImg _changeProImg;
  final LoginUser _loginUserUsecase;
  final RegisterUser _registerUser;

  AuthBloc({
    required RegisterUser registerUser,
    required ChangeProImg changeProImg,
    required LoginUser loginUserUsecase,
  })  : _registerUser = registerUser,
        _changeProImg = changeProImg,
        _loginUserUsecase = loginUserUsecase,
        super(Unauthenticated()) {
    on<AppStarted>((event, emit) async {
      var token = await _getToken();
      if (token != '') {
        emit(Authenticated());
      } else {
        emit(
          Unauthenticated(),
        );
      }
    });
    on<LoggedIn>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;

        final token = await _loginUserUsecase.call(
          Params(
            email: email,
            password: password,
          ),
        );
        token.fold((l) => print('error'), (tk) {
          _saveToken(tk);
          emit(Authenticated());
        });
      },
    );
    on<LoggedOut>(
      (event, emit) async {
        Storage().token = '';
        Storage().userId = '';
        await _deleteUserId();
        await _deleteToken();
        emit(Unauthenticated());
      },
    );
    on<ChangeProfPic>((event, emit) {
      emit(ProfPicLoading());
      final filePath = event.file;
      _changeProImg.call(
        ParamsChangeProImg(profileImage: filePath),
      );
      emit(ProfPicSuccess());
    });
    on<Register>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final name = event.name;
      final lastName = event.lastName;

      final res = await _registerUser.call(
        ParamsRegister(
            email: email, password: password, name: name, lastName: lastName),
      );
      res.fold((l) => print('error'), (res) => print(res));
    });
  }

  Future<void> _deleteUserId() async {
    await Storage().secureStorage.delete(key: 'userId');
  }

  Future<void> _deleteToken() async {
    await Storage().secureStorage.delete(key: 'token');
  }

  Future<void> _saveToken(String token) async {
    await Storage().secureStorage.write(key: 'token', value: token);
  }

  Future<String?> _getToken() async {
    return await Storage().secureStorage.read(key: 'token') ?? '';
  }
}
