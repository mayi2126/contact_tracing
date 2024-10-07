import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_pregnant/app/routes/router.dart';
import 'package:tracking_pregnant/app/routes/routes_name.dart';
import 'package:tracking_pregnant/design_system/pallete.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Palette.primary,        // Set the status bar color
      statusBarIconBrightness: Brightness.light, // Set text/icon color to light
    ));
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 759.2727272727273),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.onGenerateRoute,
          theme: ThemeData(
            highlightColor: Palette.primary,
            hintColor: Palette.white ,
            primaryColor:
                Palette.primary, // Couleur principale (#3082F6)
            scaffoldBackgroundColor:
                 Palette.white, // Couleur de fond (#EC8000)
            // textTheme: const TextTheme(
            //   bodyLarge:
            //       TextStyle(color: Palette.white), // Texte normal (blanc)
            //   bodyMedium: TextStyle(
            //       color: Palette.white), // Autres styles de texte (blanc)
            //   bodySmall: TextStyle(color: Palette.white), // Titre 1 (blanc)
            //   labelLarge: TextStyle(color: Palette.white), // Titre 2 (blanc)
            //   labelMedium: TextStyle(color: Palette.white), // Titre 3 (blanc)
            //   labelSmall: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Titre 4 (blanc)
            //   titleLarge: TextStyle(color: Palette.white), // Titre 5 (blanc
            //   titleMedium: TextStyle(color: Palette.white), // Titre 6
            //   titleSmall: TextStyle(color: Palette.white),  
            //   displayLarge: TextStyle(color: Palette.white),
            //   displayMedium: TextStyle(color: Palette.white),
            //   displaySmall: TextStyle(color: Palette.white),
            //   // Autres styles de texte (#FFFF87)
            // ),
            appBarTheme: const AppBarTheme(
              backgroundColor:
                  Palette.contentPrimary, // Couleur de fond (#EC8000)
            ),
            inputDecorationTheme: const InputDecorationTheme(

            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Palette.contentPrimary, // Couleur du curseur
            ),

            buttonTheme: const ButtonThemeData(
              buttonColor: Palette.primary, // Couleur des boutons principaux
              textTheme: ButtonTextTheme
                  .primary, // Utilise la couleur de texte définie pour les boutons
            ),
          ),
        );
      },
    );
  }
}
