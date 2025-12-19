import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/bloc/subscription_cubit.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  final List<Map<String, dynamic>> plans = const [
    {
      'plan': SubscriptionPlan.yearly,
      'title': 'Yearly',
      'subtitle': 'Billed yearly', 
      'price': '€94.80',
      'per': 'year',
      'discount': null, 
    },
    {
      'plan': SubscriptionPlan.monthly,
      'title': 'Monthly',
      'subtitle': '€10 discount',
      'price': '€10.90',
      'per': 'every month',
      'discount': '€10 discount',
    },
    {
      'plan': SubscriptionPlan.weekly,
      'title': 'Weekly',
      'subtitle': '',
      'price': '€5.90',
      'per': 'every week',
      'discount': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SubscriptionCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Subscription plans'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your\nsubscription plan',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'And get a 7-day free trial.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),

                BlocBuilder<SubscriptionCubit, SubscriptionPlan>(
                  builder: (context, selectedPlan) {
                    return Column(
                      children: plans.map((p) {
                        final plan = p['plan'] as SubscriptionPlan;
                        final isSelected = selectedPlan == plan;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () => context
                                .read<SubscriptionCubit>()
                                .selectPlan(plan),
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue[50]
                                    : Colors.grey[50],
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Radio<SubscriptionPlan>(
                                    value: plan,
                                    groupValue: selectedPlan,
                                    onChanged: (_) => context
                                        .read<SubscriptionCubit>()
                                        .selectPlan(plan),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        p['title'] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (p['subtitle']?.isNotEmpty == true)
                                        Text(
                                          p['subtitle'] as String,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        p['price'] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        p['per'] as String,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 24),
                const Text(
                  'You\'ll get:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const BulletText('Unlimited access'),
                const BulletText('200GB storage'),
                const BulletText('Sync all your devices'),

                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Subscribe',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Text('• ', style: TextStyle(color: Colors.blue, fontSize: 20)),
          Text(text),
        ],
      ),
    );
  }
}
