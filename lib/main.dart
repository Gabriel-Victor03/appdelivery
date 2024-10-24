import 'package:appdelivery/view/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:appdelivery/view/pages/home_page.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'XWN5AL2fKOQXxKnSnAdeLGHvx68NakUwPMhHTk1B';
  const keyClientKey = 'x2iLiWANqMLd1MRnotpzyyxLoJEJrTuVd2HkS3K1';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  /*await Parse().initialize(
    keyApplicationId, 
    keyParseServerUrl,
    clientKey: keyClientKey, 
    debug: true
  );*/

   // var firstObject = ParseObject('FirstClass')
  //  ..set('message', 'Hey, Parse is now connected!🙂');
  // await firstObject.save();

  print("done");
  
  
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
