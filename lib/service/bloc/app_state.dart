part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitialState implements AppState {}

class AppThemeState implements AppState {
  final ThemeData themeData;
  AppThemeState(this.themeData);
}
