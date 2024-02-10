import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeColorData().createSharedPrefObject();
  runApp(ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeColorData>(context, listen: false)
        .loadThemeFromSharedPref();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeColorData>(context).themeColor,
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Choose Theme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
                title: Provider.of<ThemeColorData>(context).isPink
                    ? Text('Pink Theme')
                    : Text('Purple Theme'),
                value: Provider.of<ThemeColorData>(context).isPink,
                onChanged: (_) {
                  Provider.of<ThemeColorData>(context, listen: false)
                      .toggleTheme();
                }),
            Card(
              child: ListTile(
                title: Text('To Do'),
                trailing: Icon(Icons.check_box),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(onPressed: () {}, child: Text('add')),
          ],
        ),
      ),
    );
  }
}
