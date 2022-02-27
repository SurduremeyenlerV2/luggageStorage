import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:luggage_storage/core/service/homeService/home_service.dart';
import 'package:meta/meta.dart';

import '../../../core/service/authService/firebase_auth_service.dart';
import '../../../core/service/localStorageService/local_storage_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeService service = HomeService();

  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final LocalStorageService _localStorageService = LocalStorageService();
  Future<void> getCities() async {
    emit(HomeLoading());
    var cities = await service.getCities();
    if (cities != null) {
      log(cities[0].values.toList().toString());
      emit(HomeLoaded(cities));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
    await _localStorageService.setBoolToLocale(key: 'auth', boolToBeSet: false);
  }
}
