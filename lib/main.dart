import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hello_translator/hello_screen.dart';
import 'package:flutter_hello_translator/localization_cubit/localization_cubit.dart';
import 'package:flutter_hello_translator/localization_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    ]);
    return BlocProvider<LocalizationCubit>(
      create: (context) => LocalizationCubit()..initialize(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          final Locale locale = context.read<LocalizationCubit>().locale;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
              ),
              useMaterial3: true,
            ),
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const HelloScreen(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    LocalizationService().dispose();
    super.dispose();
  }
}
