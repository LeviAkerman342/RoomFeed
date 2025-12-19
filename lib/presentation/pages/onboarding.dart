import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/bloc/interests_cubit.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              Image.network(
                'https://d3h2k7ug3o5pb3.cloudfront.net/image/2023-08-03/62a6b3b0-319e-11ee-aba5-d7e93230c463.png',
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 48),
              const Text(
                'Create a prototype in just\na few minutes',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Enjoy these pre-made components and worry only\nabout creating the best product ever.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Пагинация (точки)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_dot(active: true), _dot(active: false)],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final _ = context.read<InterestsCubit>().state;
                  // TODO: сохранить в Hive
                  context.go('/subscription');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot({required bool active}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 12 : 8,
      height: active ? 12 : 8,
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }
}
