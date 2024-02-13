import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorMixerNotifier(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMixer = context.watch<ColorMixerNotifier>();

    print(colorMixer.red);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Color.fromRGBO(
                  colorMixer.red,
                  colorMixer.green,
                  colorMixer.blue,
                  1,
                ),
              ),
            ),
            Column(
              children: [
                Slider(
                  activeColor: Colors.red,
                  value: colorMixer.red.toDouble(),
                  max: 255,
                  onChanged: (newValue) {
                    colorMixer.setColor(red: newValue.toInt());
                  },
                ), Slider(
                  activeColor: Colors.green,
                  value: colorMixer.green.toDouble(),
                  max: 255,
                  onChanged: (newValue) {
                    colorMixer.setColor(green: newValue.toInt());
                  },
                ), Slider(
                  activeColor: Colors.blue,
                  value: colorMixer.blue.toDouble(),
                  max: 255,
                  onChanged: (newValue) {
                    colorMixer.setColor(blue: newValue.toInt());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ColorMixerNotifier extends ChangeNotifier {
  int red = 0;
  int green = 0;
  int blue = 0;

  void setColor({int? red, int? green, int? blue}) {
    if (red != null) {
      this.red = red;
    }
    if (green != null) {
      this.green = green;
    }
    if (blue != null) {
      this.blue = blue;
    }
    notifyListeners();
  }
}
