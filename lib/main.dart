import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.startNum = 0}) : super(startNum); // default starting value

  int startNum;

  void tambahData() {
    emit(state + 1);
  }

  void kurang() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(startNum: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CUBIT APP"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: myCounter.startNum,
              stream: myCounter.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Center(
                  child: Text("${snapshot.data}",
                      style: const TextStyle(fontSize: 50)),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.kurang();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.tambahData();
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ));
  }
}
