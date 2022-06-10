part of 'part_refresh_cubit.dart';

class PartRefreshState {
  int count = 0;

  PartRefreshState init() {
    return PartRefreshState()..count = count;
  }

  PartRefreshState clone() {
    return PartRefreshState()..count = count;
  }
}
