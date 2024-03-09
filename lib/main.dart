import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/cache/styles/themes.dart';
import 'package:muslim_app/core/shared/bloc_observer.dart';
import 'package:muslim_app/features/navBar/presentation/views/navbar_screen.dart';
import 'package:muslim_app/features/settings/presenation/manager/manage_cubit/manage_cubit.dart';
import 'package:muslim_app/features/settings/presenation/manager/manage_cubit/manage_states.dart';
import 'package:muslim_app/firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ManageCubit()
            ..changeAppTheme(
              fromSP: CacheHelper.getData(key: 'isdark') ?? false,
            )
            ..changeLanguage(
              language: CacheHelper.getData(key: 'lang') ?? '',
            ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCubit, ManageStates>(
      builder: (context, state) {
        return ScreenUtilInit(
          builder: (_, child) {
            bool isDark = ManageCubit.get(context).isDark;
            String lang = ManageCubit.get(context).lang == 'ar' ? 'ar' : 'en';
            return MaterialApp(
              locale: const Locale('ar'),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: isDark ? darkTheme : lightTheme,
              home: const NavBarScreen(),
            );
          },
        );
      },
    );
  }
}
