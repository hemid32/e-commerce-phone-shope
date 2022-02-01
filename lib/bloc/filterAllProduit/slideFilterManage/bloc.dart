

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class BlocSliderRam extends Bloc<EventSliderFilterAll , double >{
  BlocSliderRam() : super(2.0);

  @override
  Stream<double> mapEventToState(EventSliderFilterAll event) async* {
    // TODO: implement mapEventToState
    if(event is EventSliderFilterRam ) {
      EventSliderFilterRam _result = event;
      yield _result.value;
    }
  }
}
class BlocSliderStorage extends Bloc<EventSliderFilterAll , double >{
  BlocSliderStorage() : super(5);

  @override
  Stream<double> mapEventToState(EventSliderFilterAll event) async* {
    // TODO: implement mapEventToState
    if(event is EventSliderFilterStorage) {
      EventSliderFilterStorage _result = event;
      yield _result.value;
    }
  }
}
class BlocSliderCamera extends Bloc<EventSliderFilterAll , double >{
  BlocSliderCamera() : super(8);

  @override
  Stream<double> mapEventToState(EventSliderFilterAll event) async* {
    // TODO: implement mapEventToState
    if(event is EventSliderFilterCamera ) {
      EventSliderFilterCamera _result = event;
      yield _result.value;
    }
  }
}

class BlocSliderPrice extends Bloc<EventSliderFilterAll , double >{
  BlocSliderPrice() : super(2000);

  @override
  Stream<double> mapEventToState(EventSliderFilterAll event) async* {
    // TODO: implement mapEventToState
    if(event is EventSliderFilterPrice ) {
      EventSliderFilterPrice _result = event;
      yield _result.value;
    }
  }
}