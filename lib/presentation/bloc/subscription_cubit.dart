import 'package:flutter_bloc/flutter_bloc.dart';

enum SubscriptionPlan { yearly, monthly, weekly }

class SubscriptionCubit extends Cubit<SubscriptionPlan> {
  SubscriptionCubit() : super(SubscriptionPlan.yearly);

  void selectPlan(SubscriptionPlan plan) => emit(plan);
}
