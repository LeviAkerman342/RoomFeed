// lib/presentation/pages/feedback_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int rating = 0;
  final Set<String> positiveTags = {};
  final Set<String> negativeTags = {};
  final TextEditingController commentController = TextEditingController();

  final List<String> positive = [
    'EASY TO USE',
    'COMPLETE',
    'HELPFUL',
    'CONVENIENT',
    'LOOKS GOOD',
  ];
  final List<String> negative = [
    'COULD HAVE MORE COMPONENTS',
    'COMPLEX',
    'NOT INTERACTIVE',
    'ONLY ENGLISH',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your project is finished.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              const Text('How would you rate the prototyping kit?'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (i) => IconButton(
                    icon: Icon(
                      i < rating ? Icons.star : Icons.star_border,
                      size: 40,
                      color: Colors.amber,
                    ),
                    onPressed: () => setState(() => rating = i + 1),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              const Text('What did you like about it?'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: positive
                    .map(
                      (tag) => FilterChip(
                        label: Text(tag),
                        selected: positiveTags.contains(tag),
                        onSelected: (_) {
                          setState(() {
                            if (positiveTags.contains(tag)) {
                              positiveTags.remove(tag);
                            } else {
                              positiveTags.add(tag);
                            }
                          });
                        },
                        selectedColor: Colors.blue[100],
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 48),
              const Text('What could be improved?'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: negative
                    .map(
                      (tag) => FilterChip(
                        label: Text(tag),
                        selected: negativeTags.contains(tag),
                        onSelected: (_) {
                          setState(() {
                            if (negativeTags.contains(tag)) {
                              negativeTags.remove(tag);
                            } else {
                              negativeTags.add(tag);
                            }
                          });
                        },
                        selectedColor: Colors.red[100],
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 48),
              const Text('Anything else?'),
              const SizedBox(height: 12),
              TextField(
                controller: commentController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Tell us everything',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
