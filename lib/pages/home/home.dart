// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraziletech/constants/enums.dart';
import 'package:fraziletech/logic/cubit/internet_cubit.dart';
import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (ctx, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Ethernet) {
                  return Text('Ethernet');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text('WiFi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile');
                } else if (state is InternetDisconnected) {
                  return Text('Disconnected');
                }
                return CircularProgressIndicator();
              },
            ),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented!) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           FloatingActionButton(
            //             heroTag: 'btn1',
            //             onPressed: () =>
            //                 BlocProvider.of<CounterCubit>(context).decrement(),
            //             tooltip: 'Decrement',
            //             child: const Icon(
            //               Icons.remove,
            //             ),
            //           ),
            //           FloatingActionButton(
            //             heroTag: 'btn2',
            //             onPressed: () =>
            //                 BlocProvider.of<CounterCubit>(context).increment(),
            //             tooltip: 'Increment',
            //             child: const Icon(
            //               Icons.add,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(
            //         height: 24.0,
            //       ),
            //       MaterialButton(
            //         color: widget.color,
            //         textColor: Colors.white,
            //         onPressed: () => Navigator.pushNamed(context, '/second'),
            //         child: const Text('Second Screen'),
            //       ),
          ],
        ),
      ),
    );
  }
}
