import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/core/locale/string_translation.dart';
import 'package:playground_flutter/features/home/cubit/home_cubit.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_layout_builder.dart';
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
                  children: state.homeData!.homeListItems //make null option
                      .map(
                        (e) => ButtonLayoutBuilder(
                          customButtonType: e.buttonType!,
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
