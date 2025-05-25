import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tekio_app/core/locale/string_translation.dart';
import 'package:tekio_app/features/app/cubit/app_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('app_name'.translate),
      ),
      body: Center(
        child: DropdownMenu(
          initialSelection: context.read<AppCubit>().state.themeMode,
          dropdownMenuEntries: [
            DropdownMenuEntry(
              label: 'default'.translate,
              value: ThemeMode.system,
            ),
            DropdownMenuEntry(
              label: 'light'.translate,
              value: ThemeMode.light,
            ),
            DropdownMenuEntry(
              label: 'dark'.translate,
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
