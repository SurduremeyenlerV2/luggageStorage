import 'package:bloc/bloc.dart';
import 'package:luggage_storage/core/service/homeService/home_service.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeService service = HomeService();

  Future<void> getCities() async{
    emit(HomeLoading());
   var cities= await service.getCities();
   emit(HomeLoaded(cities));
  }
}
