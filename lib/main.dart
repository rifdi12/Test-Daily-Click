
import 'package:fluttertest/providersetup.dart';
import 'package:provider/provider.dart';

import 'Helper/routes.dart';
import 'Helper/settingApp.dart';

void main(){
  FluroRouter.setupRouter();
  runApp(MyApp());
  }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Daily Click',
        initialRoute: 'home',
        onGenerateRoute: FluroRouter.router.generator,
      ),
    );
  }
}
