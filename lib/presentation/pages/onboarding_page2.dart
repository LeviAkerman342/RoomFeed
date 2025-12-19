import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_state.dart';
import '../bloc/interests_cubit.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  final List<String> interests = const [
    'User Interface',
    'User Experience',
    'User Research',
    'UX Writing',
    'User Testing',
    'Service Design',
    'Strategy',
    'Design Systems',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InterestsCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const LinearProgressIndicator(value: 0.5),
                const SizedBox(height: 32),
                Center(
                  child: Image.network(
                    'https://cdn.dribbble.com/userupload/20857591/file/original-0bf689aa22e8a1a3d63b33fb6dad239d.png?format=webp',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Personalise your\nexperience',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Choose your interests.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                BlocBuilder<InterestsCubit, Set<String>>(
                  builder: (context, selected) {
                    return Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: interests.map((interest) {
                        final isSelected = selected.contains(interest);
                        return ChoiceChip(
                          label: Text(interest),
                          selected: isSelected,
                          selectedColor: Colors.blue[100],
                          onSelected: (_) =>
                              context.read<InterestsCubit>().toggle(interest),
                        );
                      }).toList(),
                    );
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await AppState.completeOnboarding();
                    context.go('/subscription');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
