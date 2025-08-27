import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfee/service/auth/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/routing/go_routing.dart';
import 'core/theme/lightTheme.dart';
import 'core/theme/darkTheme.dart';
import 'features/auth/shared_preferences/preference_manager.dart';
import 'features/screen/home/controller/home_controller.dart';
import 'generated/controller/lang_local_controller.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await PreferenceManager().init();
  await Supabase.initialize(
    url: 'https://mshieodmrbgtyjihgrsr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zaGllb2RtcmJndHlqaWhncnNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyNDE4OTksImV4cCI6MjA3MTgxNzg5OX0.RqrZMGYxMSqlfNRf3Ag0ZFQPGgo2a8Yu6EgrPo4Rb7M', // Supabase Public Anon Key
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
      builder: (theme, darkTheme) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => LangController(),

          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => HomeController(),

          ),
          ChangeNotifierProvider(create: (_) => AuthNotifier()),
        ],
        child: Consumer<LangController>(
          builder: (context, provider, child) {
            return MaterialApp.router(
              locale: Locale(provider.locale ?? "en"),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routerConfig: createRouter(context),
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
