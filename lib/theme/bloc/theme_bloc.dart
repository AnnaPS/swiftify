import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.system) {
    on<ThemeModeChanged>((event, emit) => emit(event.themeMode ?? state));
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    // 0 is the default index for ThemeMode.system
    // 1 is the default index for ThemeMode.light
    // 2 is the default index for ThemeMode.dark
    return ThemeMode.values[json['theme_mode'] as int];
  }

  @override
  Map<String, int> toJson(ThemeMode state) => {'theme_mode': state.index};
}
