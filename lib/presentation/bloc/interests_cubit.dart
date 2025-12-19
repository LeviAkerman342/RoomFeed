import 'package:flutter_bloc/flutter_bloc.dart';

class InterestsCubit extends Cubit<Set<String>> {
  InterestsCubit() : super({});

  void toggle(String interest) {
    final newSet = Set<String>.from(state);
    if (newSet.contains(interest)) {
      newSet.remove(interest);
    } else {
      newSet.add(interest);
    }
    emit(newSet);
  }
}