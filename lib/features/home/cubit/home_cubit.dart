import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
// import 'package:tekio_menu/models/base_menu_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  CollectionReference homeCollectionData =
      FirebaseFirestore.instance.collection('appHomeMenu');

  getHomeConfig() async {
    DocumentSnapshot data =
        await homeCollectionData.doc('eULnsqHE6Dj24cv0hHuj').get();

    // BaseMenuModel homeData =
    //     BaseMenuModel.fromJson(data.data() as Map<String, dynamic>);

    emit(state.copyWith(
      status: HomeStatus.homeLoaded,
      // homeData: homeData,
    ));
  }
}
