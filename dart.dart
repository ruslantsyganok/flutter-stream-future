import 'dart:io';

void main() {
  var sub = doSomethingContinuouslyAsync().listen((event) {
    print(event);
  });
  print("bye!");
  sub.pause();
  sub.resume();
}

String doSomething() {
  sleep(Duration(seconds: 3));
  return "Tons of work done synchronously!";
}

Future<String> doSomethingAsync() async {
  await Future.delayed(Duration(seconds: 3));
  return "Tons of work done asynchronously!";
}

Stream<String> doSomethingContinuouslyAsync() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield "a";
  }
}
