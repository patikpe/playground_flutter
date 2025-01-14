import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/app/cubit/app_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('test_settings_app_bar_title'),
      ),
      body: Center(
        child: DropdownMenu(
          initialSelection: context.read<AppCubit>().state.themeMode,
          dropdownMenuEntries: [
            DropdownMenuEntry(
              label: 'test_dropdown_system',
              value: ThemeMode.system,
            ),
            DropdownMenuEntry(
              label: 'test_dropdown_light',
              value: ThemeMode.light,
            ),
            DropdownMenuEntry(
              label: 'test_dropdown_dark',
              value: ThemeMode.dark,
            ),
          ],
          onSelected: (value) {
            context.read<AppCubit>().changeTheme(value as ThemeMode);
          },
        ),
      ),
    );
  }
}
