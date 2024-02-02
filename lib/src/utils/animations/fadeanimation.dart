import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(
      this.delay,
      this.child, {
        Key? key,
      }) : super(key: key);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.translate(
          offset: _slideAnimation.value,
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}
