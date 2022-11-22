import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:file_manager/core/util/shared_preference.dart';
import 'package:file_manager/core/util/theme_config.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  ThemeData appTheme = ThemeData();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppBloc() : super(AppInitialState()) {
    on<SetAppTheme>(_setThemeHandler);
    on<GetCurrentAppTheme>(_getThemeHandler);
  }
  FutureOr<void> _setThemeHandler(
      SetAppTheme event, Emitter<AppState> emit) async {
    SharedPreferenceHelper.shared.setAppTheme(event.themeKey.name);
    final theme = appThemeConfig[event.themeKey]!;
    appTheme = theme;
    emit(AppThemeState(theme));
  }

  FutureOr<void> _getThemeHandler(
      GetCurrentAppTheme event, Emitter<AppState> emit) async {
    final getTheme = await SharedPreferenceHelper.shared.getAppTheme();
    appTheme = appThemeConfig[getTheme]!;
    emit(AppThemeState(appTheme));
  }
}
