import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double dx = 100;
  double dy = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (_, snapshot) {
          if(snapshot.hasData) {
            dx = dx + snapshot.data!.y;
            dy = dy + snapshot.data!.x;
          }
          return Transform.translate(
            offset: Offset(dx, dy),
            child: const CircleAvatar(
              radius: 20,
            ),
          );
        },
      )
    );
  }
}