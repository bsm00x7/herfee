import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _backgroundController;
  AnimationController? _logoController;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/');
      }
    });

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _backgroundController?.dispose();
    _logoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation:
            _backgroundController ??
            AnimationController(duration: Duration.zero, vsync: this),
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(
                    const Color(0xFF1565C0),
                    const Color(0xFF0D47A1),
                    _backgroundController?.value ?? 0.0,
                  )!,
                  Color.lerp(
                    const Color(0xFF42A5F5),
                    const Color(0xFF1976D2),
                    _backgroundController?.value ?? 0.0,
                  )!,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Floating particles background
                ...List.generate(20, (index) {
                  return Positioned(
                    left: (index * 50.0) % size.width,
                    top: (index * 80.0) % size.height,
                    child:
                        Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                            )
                            .animate(
                              onPlay: (controller) => controller.repeat(),
                            )
                            .fadeIn(duration: 2000.ms)
                            .fadeOut(duration: 2000.ms, delay: 1000.ms)
                            .scale(
                              begin: const Offset(0.5, 0.5),
                              end: const Offset(1.5, 1.5),
                              duration: 3000.ms,
                            ),
                  );
                }),

                // Main content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo container with glow effect
                      Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.2),
                                  Colors.transparent,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: 280.0,
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 80.0,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      offset: const Offset(2, 2),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  pause: const Duration(milliseconds: 1000),
                                  animatedTexts: [
                                    // Colorize effect
                                    ColorizeAnimatedText(
                                      'حرفي',
                                      textAlign: TextAlign.center,
                                      colors: [
                                        Colors.white,
                                        Colors.green,
                                        Colors.lightBlueAccent,
                                        Colors.white,
                                      ],
                                      textStyle: TextStyle(
                                        fontSize: 80.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .scale(
                            begin: const Offset(0.5, 0.5),
                            duration: 1000.ms,
                            curve: Curves.elasticOut,
                          )
                          .fadeIn(duration: 800.ms),

                      const SizedBox(height: 50),

                      // Subtitle text
                      Text(
                            'مرحباً بك',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 1500.ms, duration: 800.ms)
                          .slideY(begin: 0.3, end: 0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
