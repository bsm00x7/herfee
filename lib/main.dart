import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routing/go_routing.dart';
import 'core/theme/lightTheme.dart';
import 'core/theme/darkTheme.dart';
import 'features/auth/shared_preferences/preference_manager.dart';
import 'firebase_options.dart';
import 'generated/controller/lang_local_controller.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await PreferenceManager().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(savedThemeMode: savedThemeMode));
}
class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider( create: (BuildContext context) => LangController()),
            ],
            child: Consumer<LangController>(
              builder: (context, provider, child) {
                return MaterialApp.router(
                  locale: Locale(provider.locale ?? "fr"),
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  routerConfig: router,
                  debugShowCheckedModeBanner: false,
                  title: 'Her fee',
                  theme: theme,
                  darkTheme: darkTheme,
                );
              },
            ),
          ),
    );
  }
}
