
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello_translator/localization_service.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  Locale locale = const Locale("en");

  LocalizationCubit() : super(LocalizationInitial());

  void initialize(){
    final service = LocalizationService();
    service.initializeLanguageTimer();

    service.streamController.stream.listen(_localizationChanged);
  }

  void _localizationChanged(Locale locale) {
    this.locale = locale;
    emit(LocalizationChanged(locale));
  }
}
