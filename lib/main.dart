import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coding_challenge/modules/landing_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.playfairTextTheme(),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
