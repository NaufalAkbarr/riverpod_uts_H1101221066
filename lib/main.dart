import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'color_controller.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorControllerDemo(),
    );
  }
}

class ColorControllerDemo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorProvider); // Mengambil warna yang dihasilkan
    final hexColor = ref.watch(hexColorProvider); // Mengambil kode hex warna

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RGB Controller with Riverpod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Color Controller',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ColorSlider('R', ref.watch(redProvider), (value) {
              ref.read(redProvider.notifier).state = value;
            }),
            SizedBox(height: 20),
            ColorSlider('G', ref.watch(greenProvider), (value) {
              ref.read(greenProvider.notifier).state = value;
            }),
            SizedBox(height: 20),
            ColorSlider('B', ref.watch(blueProvider), (value) {
              ref.read(blueProvider.notifier).state = value;
            }),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: color, // Menggunakan warna yang diambil dari Provider
            ),
            SizedBox(height: 20),
            // Tampilkan hasil hex color di UI
            Text(
              'Hex Color: $hexColor',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorSlider extends StatelessWidget {
  final String label;
  final double value;
  final Function(double) onChanged;

  ColorSlider(this.label, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            onChanged: onChanged,
          ),
        ),
        Text(value.toStringAsFixed(0)), // Tampilkan nilai slider tanpa desimal
      ],
    );
  }
}
