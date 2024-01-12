import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:yeerlo/colors/app_colors.dart';
import 'package:yeerlo/data.dart';
import 'package:yeerlo/providers/notifications.dart';
import 'package:yeerlo/providers/theme.dart';
import 'package:yeerlo/screens/home/home.dart';
import 'package:yeerlo/screens/home/nearby_events.dart';
import 'package:yeerlo/screens/home/notifications.dart';
import 'package:yeerlo/screens/onboarding.dart';
import 'package:yeerlo/screens/registration/location.dart';
import 'package:yeerlo/screens/registration/reset_password.dart';
import 'package:yeerlo/screens/registration/sign_in.dart';
import 'package:yeerlo/screens/registration/sign_up.dart';
import 'package:yeerlo/screens/registration/verification.dart';
import 'package:yeerlo/screens/home/search.dart';
import 'package:yeerlo/screens/splash.dart';
import 'package:yeerlo/screens/home/upcoming_events.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
WidgetsFlutterBinding.ensureInitialized();
  storageLocation = (await getApplicationDocumentsDirectory()).path;
  await FastCachedImageConfig.init(
    subDir: storageLocation,
    clearCacheAfter: 3.days,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Yeerlo',
          theme: themeProvider.themeType == ThemeType.light
              ? ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: lightOrangeColor,
                    primary: Colors.white,
                    secondary: Colors.black,
                  ),
                  useMaterial3: false,
                  fontFamily: 'DM Sans',
                )
              : ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: darkOrangeColor,
                    primary: Colors.black,
                    secondary: Colors.white,
                  ),
                  useMaterial3: false,
                  fontFamily: 'DM Sans',
                ),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/onboarding': (context) => const OnboardingScreen(),
            '/home': (context) => const HomeScreen(),
            '/sign-in': (context) => const SignInScreen(),
            '/sign-up': (context) => const SignUpScreen(),
            '/verification': (context) => const VerificationScreen(),
            '/reset-password': (context) => const ResetPasswordScreen(),
            '/location': (context) => const LocationScreen(),
            '/search': (context) => const SearchScreen(),
            '/notifications': (context) => const NotificationsScreen(),
            '/upcoming-events': (context) => const UpcomingEventsScreen(),
            '/nearby-events': (context) => const NearbyEventsScreen(),
          },
        );
      },
    );
  }
}
