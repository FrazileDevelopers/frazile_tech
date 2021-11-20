import 'package:bloc_test/bloc_test.dart';
import 'package:fraziletech/logic/cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    // setUp(() {
    //   counterCubit =
    //       CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context));
    // });
    // tearDown(() {
    //   counterCubit!.close();
    // });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue: 5, wasIncremented:true) when cubit.increment() function is called ',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => <CounterState>[
        CounterState(
          counterValue: 5,
          wasIncremented: true,
        ),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue: -5, wasIncremented:true) when cubit.increment() function is called ',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => <CounterState>[
        CounterState(
          counterValue: -5,
          wasIncremented: false,
        ),
      ],
    );
  });
}
