import 'package:counter_app/widget/animatedemojiwidget.dart';
import 'package:counter_app/widget/buildactionbutton.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
  }

  void _showEmojiAnimation(String emoji) {
    final overlay = Overlay.of(context);
    final random = Random();

    final startX =
        random.nextDouble() * MediaQuery.of(context).size.width * 0.8 +
        MediaQuery.of(context).size.width * 0.1;
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Animatedemojiwidget(
        emoji: emoji,
        startX: startX,
        onComplete: () {
          overlayEntry.remove();
        },
      ),
    );
    overlay.insert(overlayEntry);
  }

  void _increment() {
    setState(() {
      _counter += 1;
    });
    _showEmojiAnimation('🎉');
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter -= 1;
      }
    });
    _showEmojiAnimation('😢');
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
    _showEmojiAnimation('🔄');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade100,
            Colors.purple.shade100,
            Colors.pink.shade100,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
            child: const Text(
              "Simple Counter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withValues(alpha: 0.3),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Counter Value',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 20),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: _counter.toDouble()),
                      duration: Duration(milliseconds: 300),
                      builder: (context, double value, child) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [Colors.blue, Colors.purple],
                              ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildActionButton(
                    icon: Icons.remove,
                    color: Colors.red,
                    onPressed: _decrement,
                  ),
                  SizedBox(width: 20),
                  // Reset Button
                  buildActionButton(
                    icon: Icons.refresh,
                    color: Colors.orange,
                    onPressed: _reset,
                  ),
                  SizedBox(width: 20),
                  // Increment Button
                  buildActionButton(
                    icon: Icons.add,
                    color: Colors.green,
                    onPressed: _increment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
