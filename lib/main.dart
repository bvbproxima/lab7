import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Color Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Початкові значення для RGB
  int red = 0;
  int green = 0;
  int blue = 0;

  // Функція для оновлення значень кольорів
  void updateColor(int value, String color) {
    setState(() {
      if (color == 'red') {
        red = value;
      } else if (color == 'green') {
        green = value;
      } else if (color == 'blue') {
        blue = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RGB Color Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Квадратик, що показує поточний колір
            Container(
              width: 200,
              height: 200,
              color: Color.fromRGBO(red, green, blue, 1),
              child: Center(
                child: Text(
                  'RGB($red, $green, $blue)',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Повзунок для червоного кольору
            Slider(
              value: red.toDouble(),
              min: 0,
              max: 255,
              divisions: 255,
              label: 'Red: $red',
              onChanged: (value) {
                updateColor(value.toInt(), 'red');
              },
            ),
            // Повзунок для зеленого кольору
            Slider(
              value: green.toDouble(),
              min: 0,
              max: 255,
              divisions: 255,
              label: 'Green: $green',
              onChanged: (value) {
                updateColor(value.toInt(), 'green');
              },
            ),
            // Повзунок для синього кольору
            Slider(
              value: blue.toDouble(),
              min: 0,
              max: 255,
              divisions: 255,
              label: 'Blue: $blue',
              onChanged: (value) {
                updateColor(value.toInt(), 'blue');
              },
            ),
          ],
        ),
      ),
    );
  }
}
