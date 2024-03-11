part of 'localization_cubit.dart';

abstract class LocalizationState extends Equatable {
  const LocalizationState();
}

class LocalizationInitial extends LocalizationState {
  @override
  List<Object> get props => [];
}

class LocalizationChanged extends LocalizationState {
  final Locale locale;

  LocalizationChanged(this.locale);

  @override
  List<Object> get props => [locale];
}

