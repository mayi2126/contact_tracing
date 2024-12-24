import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking/Presentation/Auth/bloc/login_bloc.dart';
import 'package:tracking/Presentation/Auth/data/Repositories/user_login_repo.dart';
import 'package:tracking/Presentation/Causeries/bloc/causerie_bloc.dart';
import 'package:tracking/Presentation/visite/bloc/visite_bloc.dart';
import 'package:tracking/app/config/app_config.dart';
import 'package:tracking/app/routes/router.dart';
import 'package:tracking/app/routes/routes_name.dart';
import 'package:tracking/design_system/pallete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/externe-data/bloc/data_bloc.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Assurez-vous que les bindings sont initialisés
  // await initializeDateFormatting('fr_FR', null);  // Initialisation de la locale 'fr_FR'

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserLoginRepo _authRepository = UserLoginRepo();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Palette.primary, // Set the status bar color
      statusBarIconBrightness: Brightness.light, // Set text/icon color to light
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(authRepository: _authRepository)
            ..add(AuthCheckStatus()),
        ),
        BlocProvider(
          create: (context) =>
              VisiteBloc(), 
        ),
        BlocProvider(
          create: (context) =>
              CauserieBloc(), 
        ),
         BlocProvider(
          create: (context) => DataBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72727272727275, 759.2727272727273),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr'), // French
            ],
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.onGenerateRoute,
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(
                // Remplace 'lato' par la police souhaitée
                Theme.of(context)
                    .textTheme
                    .apply(bodyColor: Colors.black, displayColor: Colors.black),
              ),
              highlightColor: Palette.primary,
              hintColor: Palette.white,
              primaryColor: Palette.primary, // Couleur principale (#3082F6)
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
                progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Palette.primary, // Set your preferred color here
        ),
              focusColor: Palette.white,
              appBarTheme: const AppBarTheme(
                backgroundColor:
                    Palette.contentPrimary, // Couleur de fond (#EC8000)
              ),
              inputDecorationTheme: const InputDecorationTheme(),
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
      ),
    );
  }
}
