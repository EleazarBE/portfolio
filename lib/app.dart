
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barachelle | Software Engineering',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BARACHELLE.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(
                    'SOFTWARE ENGINEER IN PROGRESS',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 2,
                      color: AppTheme.secondaryInk,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Building things\nthat make sense.',
                    style: TextStyle(
                      fontSize: 58,
                      height: 1.05,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Software engineering, local AI, and thoughtful '
                    'digital experiences.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.secondaryInk,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
