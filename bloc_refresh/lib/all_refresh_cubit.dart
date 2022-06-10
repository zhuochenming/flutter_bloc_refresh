import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'all_refresh_state.dart';

class AllRefreshCubit extends Cubit<AllRefreshState> {
  AllRefreshCubit() : super(AllRefreshState());

  void init(BuildContext context) {}

  addOne() {
    state.count = state.count + 1;
    emit(state.clone());
  }
}
