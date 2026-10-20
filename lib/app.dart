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
    final heading = Text(
      'Building things\nthat make sense.',
      style: TextStyle(
        fontSize: isMobile ? 46 : 64,
        height: 1.02,
        fontWeight: FontWeight.w900,
        letterSpacing: isMobile ? -2 : -3.5,
      ),
    );

    final introduction = const Text(
      'Software engineering, local AI, and thoughtful digital '
      'experiences — built with curiosity and purpose.',
      style: TextStyle(fontSize: 16, height: 1.8, color: AppTheme.secondaryInk),
    );

    final action = FilledButton(
      onPressed: () => _goTo(_projectsKey),
      style: FilledButton.styleFrom(
        backgroundColor: AppTheme.ink,
        foregroundColor: AppTheme.background,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'EXPLORE MY WORK',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
              fontSize: 11,
            ),
          ),
          SizedBox(width: 14),
          Icon(Icons.arrow_outward, size: 16),
        ],
      ),
    );

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              child: Divider(color: AppTheme.ink, thickness: 2),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'SOFTWARE ENGINEER IN PROGRESS',
                softWrap: true,
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1.4,
                  color: AppTheme.secondaryInk,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        heading,
        const SizedBox(height: 22),
        introduction,
        const SizedBox(height: 28),
        action,
        const SizedBox(height: 30),
        const Text(
          'SOFTWARE  /  LOCAL AI  /  CREATIVE ENGINEERING',
          style: TextStyle(
            fontSize: 9,
            letterSpacing: 1.1,
            color: AppTheme.secondaryInk,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    return Container(
      key: _homeKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 28 : 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile) ...[
            copy,
            const SizedBox(height: 36),
            const _MangaHeroArtwork(),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 11,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: copy,
                  ),
                ),
                const Expanded(flex: 9, child: _MangaHeroArtwork()),
              ],
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
    const accent = Color(0xFFC7FF4A);

    return Container(
      key: _aboutKey,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              _eyebrow('02 / ENGINEERING DOSSIER'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Curiosity into\\ncapability.',
            style: TextStyle(
              fontSize: isMobile ? 40 : 64,
              height: 1.0,
              fontWeight: FontWeight.w900,
              letterSpacing: isMobile ? -2 : -3.5,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 650),
            child: Text(
              'Software Engineering student at UNIMAS. I build practical '
              'applications, explore local AI systems, and learn by '
              'turning real problems into working software.',
              style: TextStyle(
                fontSize: 15,
                height: 1.9,
                color: AppTheme.secondaryInk,
              ),
            ),
          ),
          const SizedBox(height: 42),

          // Career and education timeline
          const _DossierLabel(
            number: '01',
            title: 'THE JOURNEY',
            subtitle: 'EDUCATION / DEVELOPMENT',
          ),
          const SizedBox(height: 20),
          _TimelinePanel(
            isMobile: isMobile,
            year: '2021 — 2024',
            index: '01',
            title: 'Politeknik Kuching Sarawak',
            detail: 'Diploma studies',
            note: 'Built a foundation for the next stage of software engineering.',
          ),
          _TimelinePanel(
            isMobile: isMobile,
            year: '2024 — 2028',
            index: '02',
            title: 'Universiti Malaysia Sarawak',
            detail: 'Software Engineering · Undergraduate',
            note: 'Developing software projects, requirements analysis, and application engineering.',
            highlighted: true,
          ),
          _TimelinePanel(
            isMobile: isMobile,
            year: 'IN PROGRESS',
            index: '03',
            title: 'Independent Engineering',
            detail: 'Local AI / Desktop applications',
            note: 'Exploring local LLMs, voice interaction, and desktop integration through Jarvis.',
          ),

          const SizedBox(height: 48),

          // Interactive skills
          const _DossierLabel(
            number: '02',
            title: 'TECHNICAL ARSENAL',
            subtitle: 'SELECT A CATEGORY',
          ),
          const SizedBox(height: 20),
          const _InteractiveSkillsPanel(),

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

class _MangaHeroArtwork extends StatelessWidget {
  const _MangaHeroArtwork();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.82,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          border: Border.all(color: AppTheme.ink, width: 2),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Subtle manga screentone dots.
            Positioned.fill(child: CustomPaint(painter: _MangaDotsPainter())),

            // Technical framing lines.
            Positioned(
              left: 18,
              top: 18,
              right: 18,
              bottom: 18,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                ),
              ),
            ),

            // Mechanical structure.
            Positioned(
              left: 45,
              top: 110,
              child: Transform.rotate(
                angle: -0.55,
                child: Container(
                  width: 100,
                  height: 260,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBDBDBD),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Column(
                    children: List.generate(
                      8,
                      (index) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? const Color(0xFF292929)
                                : const Color(0xFF777777),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Main mechanical joint.
            Positioned(
              top: 115,
              right: 35,
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF242424),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Center(
                  child: Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFBDBDBD),
                      border: Border.all(color: Colors.black, width: 5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.settings,
                        size: 34,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Foreground mechanical plate.
            Positioned(
              right: 35,
              bottom: 110,
              child: Transform.rotate(
                angle: 0.35,
                child: Container(
                  width: 135,
                  height: 92,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E7E1),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Center(
                    child: Icon(Icons.memory, color: Colors.black, size: 58),
                  ),
                ),
              ),
            ),

            // Editorial labels.
            const Positioned(
              left: 30,
              top: 30,
              child: Text(
                'FIG. 001',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Positioned(
              right: 28,
              top: 30,
              child: Text(
                'SYSTEM / 01',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 8,
                  letterSpacing: 1,
                ),
              ),
            ),
            const Positioned(
              left: 30,
              bottom: 30,
              child: Text(
                'HUMAN × MACHINE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Positioned(
              right: 30,
              bottom: 30,
              child: Icon(Icons.north_east, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _MangaDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.13)
      ..style = PaintingStyle.fill;

    const spacing = 9.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DossierLabel extends StatelessWidget {
  const _DossierLabel({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  final String number;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            color: Color(0xFF6A7E39),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
            ),
          ),
        ),
        Flexible(
          child: Text(
            subtitle,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 8,
              letterSpacing: 0.7,
              color: AppTheme.secondaryInk,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimelinePanel extends StatelessWidget {
  const _TimelinePanel({
    required this.isMobile,
    required this.year,
    required this.index,
    required this.title,
    required this.detail,
    required this.note,
    this.highlighted = false,
  });

  final bool isMobile;
  final String year;
  final String index;
  final String title;
  final String detail;
  final String note;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFC7FF4A);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: highlighted ? AppTheme.ink : AppTheme.surface,
        border: Border.all(color: highlighted ? AppTheme.ink : AppTheme.border),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 5, color: highlighted ? accent : AppTheme.border),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'LOG_$index',
                          style: TextStyle(
                            fontSize: 9,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w900,
                            color: highlighted ? accent : AppTheme.secondaryInk,
                          ),
                        ),
                        const Spacer(),
                        Flexible(
                          child: Text(
                            year,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: highlighted
                                  ? Colors.white70
                                  : AppTheme.secondaryInk,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 17 : 21,
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                        color: highlighted ? AppTheme.background : AppTheme.ink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      detail,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: highlighted ? accent : AppTheme.secondaryInk,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      note,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.7,
                        color: highlighted
                            ? Colors.white70
                            : AppTheme.secondaryInk,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractiveSkillsPanel extends StatefulWidget {
  const _InteractiveSkillsPanel();

  @override
  State<_InteractiveSkillsPanel> createState() =>
      _InteractiveSkillsPanelState();
}

class _InteractiveSkillsPanelState extends State<_InteractiveSkillsPanel> {
  int _selectedCategory = 0;

  static const _categories = <String>[
    'LANGUAGES',
    'FRAMEWORKS',
    'AI / SYSTEMS',
    'TOOLS',
  ];

  static const _skills = <List<String>>[
    ['Dart', 'TypeScript', 'Python', 'SQL'],
    ['Flutter', 'React', 'Electron', 'REST APIs'],
    ['Ollama', 'Local LLMs', 'ONNX Runtime', 'Voice Activity Detection'],
    ['Git', 'GitHub', 'VS Code', 'Linux / CLI'],
  ];

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFC7FF4A);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.ink,
        border: Border.all(color: AppTheme.ink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.terminal, size: 18, color: accent),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'SKILL_MATRIX.exe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Text(
                'INTERACTIVE',
                style: TextStyle(color: accent, fontSize: 8, letterSpacing: 1),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(_categories.length, (index) {
              final selected = _selectedCategory == index;

              return Semantics(
                button: true,
                selected: selected,
                child: InkWell(
                  onTap: () => setState(() {
                    _selectedCategory = index;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? accent : Colors.transparent,
                      border: Border.all(
                        color: selected ? accent : Colors.white30,
                      ),
                    ),
                    child: Text(
                      _categories[index],
                      style: TextStyle(
                        color: selected ? AppTheme.ink : Colors.white70,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.04, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Wrap(
              key: ValueKey(_selectedCategory),
              spacing: 9,
              runSpacing: 9,
              children: _skills[_selectedCategory].map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 10),
          Text(
            'MODULE ${(_selectedCategory + 1).toString().padLeft(2, '0')} '
            '/ ${_categories[_selectedCategory]}',
            style: const TextStyle(
              color: accent,
              fontSize: 9,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
