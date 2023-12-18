part of 'theme_change_bloc.dart';

@immutable
abstract class ThemeChangeEvent {}

class ThemeChanged extends ThemeChangeEvent {
  final bool isDark;
  ThemeChanged({required this.isDark});
}