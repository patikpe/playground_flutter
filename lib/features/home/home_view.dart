import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/core/locale/string_translation.dart';
import 'package:playground_flutter/features/home/cubit/home_cubit.dart';
import 'package:playground_flutter/models/home/home_model.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/custom_button_enum.dart';
import 'package:playground_flutter/features/home/home_layout_builder.dart';
import 'package:playground_flutter/widgets/general_widgets/app_loading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.homeInitial:
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<HomeCubit>().getHomeConfig();
              });
              return AppLoading();
            case HomeStatus.homeLoaded:
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text('app_name'.translate),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          'app_name'.translate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('settings'.translate),
                        onTap: () {
                          context.push('/settings');
                        },
                      ),
                    ],
                  ),
                ),
                body: ListView(
                  children: homeDataStuff.buttonListItems
                      .map(
                        (e) => HomeLayoutBuilder(
                          customButtonType: e.buttonType,
                          buttonItems: e.buttonItems,
                        ),
                      )
                      .toList(),
                ),
              );
          }
        },
      ),
    );
  }
}

HomeModel homeDataStuff = HomeModel(
  buttonListItems: [
    ButtonTypeListModel(
      buttonType: CustomButtonEnum.iconCarousel,
      buttonItems: [
        ButtonTypeModel(
          onPress: () {},
          image: '0xe6a1',
          label: 'Cameras',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xe37b',
          label: 'Lighting',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xe656',
          label: 'Climate',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xe6e7',
          label: 'Wifi',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xe378',
          label: 'Media',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xf0794',
          label: 'Security',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xe3d8',
          label: 'Safety',
        ),
        ButtonTypeModel(
          onPress: () {},
          image: '0xe047',
          label: 'More',
        ),
      ],
    ),
    ButtonTypeListModel(
      buttonType: CustomButtonEnum.textCarousel,
      buttonItems: [
        ButtonTypeModel(
          onPress: () {},
          label: 'Cameras',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'Lighting',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'Climate',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'Wifi',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'Media',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'Security',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'Safety',
        ),
        ButtonTypeModel(
          onPress: () {},
          label: 'More',
        ),
      ],
    ),
    ButtonTypeListModel(
      buttonType: CustomButtonEnum.imageCarousel,
      buttonItems: [
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
          label: 'The Flow',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png',
          label: 'Through the Pane',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
          label: 'Iridescence',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png',
          label: 'Sea Change',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_5.png',
          label: 'Blue Symphony',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_6.png',
          label: 'When It Rains',
        ),
      ],
    ),
    // Single Button Image
    ButtonTypeListModel(
      buttonType: CustomButtonEnum.imageButton,
      buttonItems: [
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
          label: 'The Flow',
        ),
      ],
    ),
    // Double Button Image
    ButtonTypeListModel(
      buttonType: CustomButtonEnum.imageButton,
      buttonItems: [
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
          label: 'The Flow',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png',
          label: 'Through the Pane',
        ),
      ],
    ),
    // Triple Button Image
    ButtonTypeListModel(
      buttonType: CustomButtonEnum.imageButton,
      buttonItems: [
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png',
          label: 'The Flow',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png',
          label: 'Through the Pane',
        ),
        ButtonTypeModel(
          onPress: () {},
          image:
              'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
          label: 'Iridescence',
        ),
      ],
    ),
  ],
);
