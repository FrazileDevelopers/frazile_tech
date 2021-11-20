part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int? counterValue;
  bool? wasIncremented;

  CounterState({
    @required this.counterValue,
    this.wasIncremented,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState &&
        other.counterValue == counterValue &&
        other.wasIncremented == wasIncremented;
  }

  @override
  int get hashCode => counterValue.hashCode ^ wasIncremented.hashCode;

  @override
  List<Object?> get props => [counterValue, wasIncremented];
}
