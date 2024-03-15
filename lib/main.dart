import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/themes.dart';
import 'package:muslim_app/core/shared/bloc_observer.dart';
import 'package:muslim_app/core/utils/get_it.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/data/repo/azkar_repo_impl.dart';
import 'package:muslim_app/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:muslim_app/features/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:muslim_app/features/nav_bar/presentation/views/navbar_screen.dart';
import 'package:muslim_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_cubit.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/features/settings/presenation/manager/manage_cubit/manage_cubit.dart';
import 'package:muslim_app/features/settings/presenation/manager/manage_cubit/manage_states.dart';
import 'package:muslim_app/firebase_options.dart';
import 'core/sevices/permission_service.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  PermissionService.requestLocationPremissions();
  PermissionService.requestNotificationPremissions();

  setLocator();
  Hive.registerAdapter(ZekrAdapter());
  await Hive.openBox<Zekr>(azkarBox);

  late Widget startWidget;
  bool isSkip = CacheHelper.getData(key: 'isSkip') ?? false;
  if (isSkip) {
    startWidget = const NavBarScreen();
  } else {
    startWidget = const OnboardingScreen();
  }

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
        ),
        BlocProvider(
          create: (context) => LocationCubit()..getLocationAddress(),
        ),
        BlocProvider(
          create: (context) => AzkarCubit(
            getIt.get<AzkarRepoImpl>(),
          )..getAzkar(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(
            getIt.get<AzkarRepoImpl>(),
          )..getFavorite(),
        ),
        BlocProvider(
          create: (context) => QuranCubit()..loadQuran(),
        ),
        BlocProvider(
          create: (context) => AyahCubit()..loadTafseer(),
        )
      ],
      child: MyApp(startWidget: startWidget),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCubit, ManageStates>(
      builder: (context, state) {
        return ScreenUtilInit(
          builder: (_, child) {
            bool isDark = ManageCubit.get(context).isDark;
            String lang = ManageCubit.get(context).lang == 'ar' ? 'ar' : 'en';
            return MaterialApp(
              locale: Locale(lang),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: isDark ? darkTheme : lightTheme,
              home: startWidget,
            );
          },
        );
      },
    );
  }
}
