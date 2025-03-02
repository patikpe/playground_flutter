import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';
import 'package:playground_flutter/models/custom_button/custom_list_button_model.dart';
import 'package:playground_flutter/models/home/home_model.dart';
import 'package:playground_flutter/models/custom_button/custom_button_enum.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  getHomeConfig() {
    HomeModel homeData = HomeModel(
      homeListItems: [
        CustomListButtonModel(
          buttonType: CustomButtonEnum.iconCarousel,
          buttonItems: [
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe6a1',
              label: 'Cameras',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe37b',
              label: 'Lighting',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe656',
              label: 'Climate',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe6e7',
              label: 'Wifi',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe378',
              label: 'Media',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xf0794',
              label: 'Security',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe3d8',
              label: 'Safety',
            ),
            CustomButtonModel(
              onPress: () {},
              iconCode: '0xe047',
              label: 'More',
            ),
          ],
        ),
        CustomListButtonModel(
          buttonType: CustomButtonEnum.textCarousel,
          buttonItems: [
            CustomButtonModel(
              onPress: () {},
              label: 'Cameras',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'Lighting',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'Climate',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'Wifi',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'Media',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'Security',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'Safety',
            ),
            CustomButtonModel(
              onPress: () {},
              label: 'More',
            ),
          ],
        ),
        CustomListButtonModel(
          buttonType: CustomButtonEnum.imageCarousel,
          buttonItems: [
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
              label: 'The Flow',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png',
              label: 'Through the Pane',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
              label: 'Iridescence',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png',
              label: 'Sea Change',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_5.png',
              label: 'Blue Symphony',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_6.png',
              label: 'When It Rains',
            ),
          ],
        ),
        // Single Button Image
        CustomListButtonModel(
          buttonType: CustomButtonEnum.imageButton,
          buttonItems: [
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
              label: 'The Flow',
            ),
          ],
        ),
        // Double Button Image
        CustomListButtonModel(
          buttonType: CustomButtonEnum.imageButton,
          buttonItems: [
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
              label: 'The Flow',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png',
              label: 'Through the Pane',
            ),
          ],
        ),
        // Triple Button Image
        CustomListButtonModel(
          buttonType: CustomButtonEnum.imageButton,
          buttonItems: [
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
              label: 'The Flow',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png',
              label: 'Through the Pane',
            ),
            CustomButtonModel(
              onPress: () {},
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
              label: 'Iridescence',
            ),
          ],
        ),
      ],
    );
    emit(state.copyWith(
      status: HomeStatus.homeLoaded,
      homeData: homeData,
    ));
  }
}
