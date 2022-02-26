import 'package:bloc/bloc.dart';
import 'package:luggage_storage/core/service/authService/firebase_auth_service.dart';
import 'package:luggage_storage/core/service/localStorageService/local_storage_service.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<void> signInWithGoogle() async{
    emit(AuthLoading());
    try{
      await _firebaseAuthService.googleSignIn();
      await _localStorageService.setBoolToLocale(key: 'auth',boolToBeSet: true);
      emit(AuthSucces());
    }
    catch(e){
      emit(AuthFailed(e.toString()));
    } 
  }
}
