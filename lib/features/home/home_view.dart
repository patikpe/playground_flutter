import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/core/locale/string_translation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text('test_label'.translate),
      ),
    );
  }
}
