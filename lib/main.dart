import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings/app_settings.dart';
import 'settings/story_progress.dart';
import 'screens/splash_screen.dart';
import 'services/user_location_service.dart';
import 'services/podcast_manager.dart';
import 'settings/currency_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettings()),
        ChangeNotifierProvider(create: (_) => StoryProgress()),
        ChangeNotifierProvider(create: (_) => PodcastManager()),
        ChangeNotifierProvider(create: (_) => CurrencyManager()),
        ChangeNotifierProvider(
          create: (_) {
            final service = UserLocationService();
            service.startTracking();
            return service;
          },
        ),
      ],
      child: const NNFinanceApp(),
    ),
  );
}

class NNFinanceApp extends StatelessWidget {
  const NNFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();

    const beigePrimary = Color(0xFFAC876D);
    final bool isDark =
        settings.colorScheme == ColorSchemeOption.dark;

    final baseColor = beigePrimary;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: baseColor,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ).copyWith(primary: baseColor),
        scaffoldBackgroundColor: settings.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: settings.backgroundColor,
          foregroundColor: settings.textColor,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: baseColor,
          unselectedItemColor:
              isDark ? Colors.grey.shade400 : Colors.grey.shade600,
        ),
        iconTheme: IconThemeData(color: baseColor),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: settings.textColor),
          bodyMedium: TextStyle(color: settings.textColor),
          titleLarge: TextStyle(color: settings.textColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: baseColor,
            foregroundColor: settings.textColor,
          ),
        ),
      ),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaleFactor: settings.textScale,
          ),
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}