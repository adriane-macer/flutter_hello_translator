import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Center(
      child: SizedBox(
          width: 250.0,
          child: Text(AppLocalizations.of(context)!.hello,
            textAlign: TextAlign.center,
            style:
            const TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
          )),
    ));
  }
}
