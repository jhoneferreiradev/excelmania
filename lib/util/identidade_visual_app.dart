import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IdentidadeVisualApp {

  BuildContext context;

  IdentidadeVisualApp({required this.context});

  TextStyle get textoTitulo => Theme.of(context).textTheme.titleLarge!;
  TextStyle get textoSubtitulo => Theme.of(context).textTheme.titleMedium!.apply(fontStyle: FontStyle.italic);
  TextStyle get textoComum => Theme.of(context).textTheme.bodyMedium!;

  Color get corBackgroundPrimario => Theme.of(context).colorScheme.primaryContainer;
  Color get corPrimaria => Theme.of(context).colorScheme.primary;
  Color get corOnPrimaria => Theme.of(context).colorScheme.onPrimary;

  Color get corSecundaria => Theme.of(context).colorScheme.secondary;
  Color get corOnSecundaria => Theme.of(context).colorScheme.onSecondary;

}