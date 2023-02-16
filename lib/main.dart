import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '달토끼',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    Get.put(DistanceController());
    final controller = Get.find<DistanceController>();
    return Scaffold(
      body: Center(
        child: GetBuilder<DistanceController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                GetBuilder<DistanceController>(
                    builder: (_) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: controller.heart ? 1 : 0,
                        child: const Text(
                          '💕''새해 🧧 많이 받으세요 !''💕',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 20),
                        ))),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('🐰', style: TextStyle(fontSize: 35)),
                  GetBuilder<DistanceController>(
                      builder: (_) => AnimatedSize(
                          duration: const Duration(milliseconds: 500),
                          child: SizedBox(width: controller.distance))),
                  const Text('🥕', style: TextStyle(fontSize: 35))
                 ],
                ),
              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
            onPressed: () {
            controller.getClose();
            },
            child: const Text('주기')),
            const SizedBox(width: 20),
            ElevatedButton(
            onPressed: () {
            controller.getFar();
            },
            child: const Text('뺏기')),
            ],
            )

              ],
            );
          },
        ),
      ),
    );
  }
}
