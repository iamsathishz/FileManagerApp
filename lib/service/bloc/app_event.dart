part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppInitial implements AppEvent {}

class SetAppTheme implements AppEvent {
  final AppThemeKey themeKey;
  SetAppTheme({required this.themeKey});
}

class GetCurrentAppTheme implements AppEvent {}
