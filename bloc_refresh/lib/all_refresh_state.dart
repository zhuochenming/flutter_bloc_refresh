part of 'all_refresh_cubit.dart';

class AllRefreshState {
  int count = 0;

  AllRefreshState init() {
    return AllRefreshState()..count = count;
  }

  AllRefreshState clone() {
    return AllRefreshState()..count = count;
  }
}