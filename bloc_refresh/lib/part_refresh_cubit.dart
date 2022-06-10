import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'part_refresh_state.dart';

class PartRefreshCubit extends Cubit<PartRefreshState> {
  PartRefreshCubit() : super(PartRefreshState());

  void init(BuildContext context) {}

  addTwo() {
    state.count = state.count + 2;
    emit(state.clone());
  }
}
