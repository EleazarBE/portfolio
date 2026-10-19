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

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final _homeKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _goTo(GlobalKey key) {
    final target = key.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 700;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 48,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _navigation(isMobile),
                        _hero(isMobile),
                        _projects(isMobile),
                        _about(isMobile),
                        _contact(isMobile),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _navigation(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'BARACHELLE.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                _navLink('Projects', _projectsKey),
                _navLink('About', _aboutKey),
                _navLink('Contact', _contactKey),
              ],
            )
          else
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              onSelected: (value) {
                switch (value) {
                  case 'Projects':
                    _goTo(_projectsKey);
                  case 'About':
                    _goTo(_aboutKey);
                  case 'Contact':
                    _goTo(_contactKey);
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'Projects', child: Text('Projects')),
                PopupMenuItem(value: 'About', child: Text('About')),
                PopupMenuItem(value: 'Contact', child: Text('Contact')),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navLink(String label, GlobalKey key) {
    return TextButton(
      onPressed: () => _goTo(key),
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.ink,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(label),
    );
  }

  Widget _hero(bool isMobile) {
    return Container(
      key: _homeKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 72 : 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SOFTWARE ENGINEER IN PROGRESS',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              color: AppTheme.secondaryInk,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Building things\nthat make sense.',
            style: TextStyle(
              fontSize: isMobile ? 48 : 76,
              height: 1.02,
              fontWeight: FontWeight.w900,
              letterSpacing: isMobile ? -2 : -4,
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(
            width: 520,
            child: Text(
              'Software engineering, local AI, and thoughtful digital '
              'experiences — built with curiosity and purpose.',
              style: TextStyle(
                fontSize: 17,
                height: 1.8,
                color: AppTheme.secondaryInk,
              ),
            ),
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => _goTo(_projectsKey),
            style: FilledButton.styleFrom(
              backgroundColor: AppTheme.ink,
              foregroundColor: AppTheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text('EXPLORE MY WORK  ↗'),
          ),
          const SizedBox(height: 48),
          const Divider(),
        ],
      ),
    );
  }

  Widget _projects(bool isMobile) {
    return Container(
      key: _projectsKey,
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow('01 / SELECTED WORK'),
          const SizedBox(height: 16),
          Text(
            'Projects.',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.w800,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 32),
          if (isMobile) ...[
            _projectCard(
              number: '01',
              name: 'JARVIS',
              category: 'LOCAL AI · DESKTOP',
              description:
                  'A personal desktop assistant exploring local language '
                  'models, voice interaction, and privacy-conscious AI.',
              technologies: 'Electron · React · TypeScript · Python',
            ),
            const SizedBox(height: 16),
            _projectCard(
              number: '02',
              name: 'BoMI',
              category: 'INVENTORY · MOBILE',
              description:
                  'An AI-assisted inventory management concept designed '
                  'to help medispa teams manage stock and branch activity.',
              technologies: 'Flutter · Dart · Supabase · Gemini',
            ),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _projectCard(
                    number: '01',
                    name: 'JARVIS',
                    category: 'LOCAL AI · DESKTOP',
                    description:
                        'A personal desktop assistant exploring local '
                        'language models, voice interaction, and '
                        'privacy-conscious AI.',
                    technologies: 'Electron · React · TypeScript · Python',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _projectCard(
                    number: '02',
                    name: 'BoMI',
                    category: 'INVENTORY · MOBILE',
                    description:
                        'An AI-assisted inventory management concept '
                        'designed to help medispa teams manage stock '
                        'and branch activity.',
                    technologies: 'Flutter · Dart · Supabase · Gemini',
                  ),
                ),
              ],
            ),
          const SizedBox(height: 32),
          const Divider(),
        ],
      ),
    );
  }

  Widget _projectCard({
    required String number,
    required String name,
    required String category,
    required String description,
    required String technologies,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(color: AppTheme.secondaryInk, fontSize: 13),
          ),
          const SizedBox(height: 40),
          Text(
            name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.secondaryInk,
            ),
          ),
          const SizedBox(height: 20),
          Text(description, style: const TextStyle(height: 1.7)),
          const SizedBox(height: 24),
          Text(
            technologies,
            style: const TextStyle(fontSize: 12, color: AppTheme.secondaryInk),
          ),
        ],
      ),
    );
  }

  Widget _about(bool isMobile) {
    return Container(
      key: _aboutKey,
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow('02 / ABOUT'),
          const SizedBox(height: 20),
          Text(
            'Engineering with curiosity.',
            style: TextStyle(
              fontSize: isMobile ? 32 : 44,
              fontWeight: FontWeight.w800,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 700,
            child: Text(
              'I am a Software Engineering student at UNIMAS interested in '
              'building practical software, exploring local AI systems, '
              'and understanding how thoughtful engineering solves '
              'real problems.',
              style: TextStyle(
                fontSize: 16,
                height: 1.9,
                color: AppTheme.secondaryInk,
              ),
            ),
          ),
          const SizedBox(height: 28),
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _SkillTag('Flutter / Dart'),
              _SkillTag('TypeScript / React'),
              _SkillTag('Python'),
              _SkillTag('REST APIs'),
              _SkillTag('Git / GitHub'),
              _SkillTag('Local AI / LLMs'),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(),
        ],
      ),
    );
  }

  Widget _contact(bool isMobile) {
    return Container(
      key: _contactKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eyebrow('03 / CONTACT'),
          const SizedBox(height: 20),
          Text(
            'Let’s build something meaningful.',
            style: TextStyle(
              fontSize: isMobile ? 32 : 44,
              fontWeight: FontWeight.w800,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Open to learning, collaboration, and software engineering '
            'opportunities.',
            style: TextStyle(color: AppTheme.secondaryInk, height: 1.8),
          ),
          const SizedBox(height: 48),
          const Divider(),
          const SizedBox(height: 20),
          const Text(
            '© 2026 BARACHELLE. BUILT WITH FLUTTER.',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 1.2,
              color: AppTheme.secondaryInk,
            ),
          ),
        ],
      ),
    );
  }

  Widget _eyebrow(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        letterSpacing: 2,
        fontWeight: FontWeight.w700,
        color: AppTheme.secondaryInk,
      ),
    );
  }
}

class _SkillTag extends StatelessWidget {
  const _SkillTag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: AppTheme.border)),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
