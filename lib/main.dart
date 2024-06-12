import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:e_coaching/src/core/commons/cubits/app_user/app_user_cubit.dart';
import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:e_coaching/src/core/locator/index.dart';
import 'package:e_coaching/src/core/router/index.dart';
import 'package:e_coaching/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:e_coaching/src/l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (_) => locator<AuthenticationBloc>()
            ..add(AuthenticationUserIsLoggedIn()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(468, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          print(state);
          return state is AppUserLoggedIn;
        },
        builder: (context, state) {
          if (state) {
            // return const Scaffold(
            //   body: Center(
            //     child: Text('Logged In'),
            //   ),
            // );
            print("Logged in");
            _router.push(const RegistrationRoute());
          }
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Dex E-Coaching',
            supportedLocales: L10n.all,
            locale: const Locale('fr'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
              scaffoldBackgroundColor: Colors.grey.shade100,
              appBarTheme: const AppBarTheme(
                elevation: 0.0,
                // centerTitle: true,
              ),
              textTheme: GoogleFonts.jostTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryColor: kPrimaryColor,
              primarySwatch: Colors.amber,
              inputDecorationTheme: InputDecorationTheme(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                filled: true,
                fillColor: Colors.grey.shade200,
                // fillColor: Colors.white,
                iconColor: kPrimaryColor,
                labelStyle: const TextStyle(color: Colors.black),
                // isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.w, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.w, color: Colors.red),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              checkboxTheme: CheckboxThemeData(
                checkColor: WidgetStateProperty.all(kPrimaryColor),
                // fillColor: WidgetStateProperty.all(kPrimaryColor),
              ),
              radioTheme: RadioThemeData(
                fillColor: WidgetStateProperty.all(kPrimaryColor),
              ),
            ),
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
