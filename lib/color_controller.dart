import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// State provider untuk masing-masing warna RGB
final redProvider = StateProvider<double>((ref) => 125.0);
final greenProvider = StateProvider<double>((ref) => 125.0);
final blueProvider = StateProvider<double>((ref) => 125.0);

// Provider untuk menghitung warna berdasarkan nilai RGB
final colorProvider = Provider<Color>((ref) {
  final red = ref.watch(redProvider);
  final green = ref.watch(greenProvider);
  final blue = ref.watch(blueProvider);

  return Color.fromARGB(255, red.toInt(), green.toInt(), blue.toInt());
});

// Provider untuk menghitung kode hex dari RGB
final hexColorProvider = Provider<String>((ref) {
  final red = ref.watch(redProvider).toInt();
  final green = ref.watch(greenProvider).toInt();
  final blue = ref.watch(blueProvider).toInt();

  return '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase();
});
