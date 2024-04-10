import 'package:chatgpt_clone/controllers/provider_one.dart';
import 'package:chatgpt_clone/utils/route.dart';
import 'package:chatgpt_clone/views/screens/home.dart';
import 'package:chatgpt_clone/views/screens/image.dart';
import 'package:chatgpt_clone/views/screens/splash.dart';
import 'package:chatgpt_clone/views/screens/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(
    ChangeNotifierProvider(create: (context) => ProviderOne(),child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      brightness: (Provider.of<ProviderOne>(context).isDark)?Brightness.light:Brightness.dark,
      colorSchemeSeed: Colors.teal.shade700,
    ),
      routes: {
      '/':(context) => const SplashPage(),
        MyRoutes.home:(context) => const HomePage(),
        MyRoutes.text:(context) => const TextPage(),
        MyRoutes.image:(context) => const ImagePage(),
      },
    );
  }
}
