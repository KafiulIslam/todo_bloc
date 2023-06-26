part of 'switch_bloc.dart';

@immutable
abstract class SwitchEvent extends Equatable{
    switchEven();

    @override
  List<Object> get props => [];

}

class SwitchOnEvent extends SwitchEvent{
  @override
  switchEven() {
    // TODO: implement switchEven
    throw UnimplementedError();
  }
}

class SwitchOffEvent extends SwitchEvent{
  @override
  switchEven() {
    // TODO: implement switchEven
    throw UnimplementedError();
  }
}
