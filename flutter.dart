import 'dart:async';

import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int musicStream = 1;

  Stream<int> initPlayer() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield musicStream;
      setState(() {
        musicStream++;
      });
    }
  }

  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    sub = initPlayer().listen((event) {});
  }

  void pause() {
    sub.pause();
  }

  void resume() {
    sub.resume();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CupertinoButton(child: const Text("Play"), onPressed: resume),
                CupertinoButton(child: const Text("Stop"), onPressed: pause),
                Text(musicStream.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
