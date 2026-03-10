import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  String? _selectedInterest;

  final List<String> _interests = [
    'Kuliner',
    'Kerajinan',
    'Wisata',
    'Retail'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Minat Usaha'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lengkapi Profil Bisnis',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '2 dari 2',
                        style: TextStyle(
                          color: Color(0xFF0287CF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 1.0,
                    backgroundColor: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    minHeight: 8,
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apa minat usaha Anda?',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2,
                      ),
                      itemCount: _interests.length,
                      itemBuilder: (context, index) {
                        final interest = _interests[index];
                        final isSelected = _selectedInterest == interest;

                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedInterest = interest;
                            });
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                                : Theme.of(context).cardColor,
                              border: Border.all(
                                color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.withOpacity(0.3),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              interest,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Button
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedInterest == null ? null : () {
                    // TODO: Save data
                    context.go('/dashboard');
                  },
                  child: const Text('Lanjutkan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
