import 'package:flutter/material.dart';
import "./index.dart";

class Effect extends StatefulWidget {
  const Effect(this.builder, {super.key});

  final Widget Function() builder;

  @override
  State<Effect> createState() => _EffectState();
}

class _EffectState extends State<Effect> {
  late ReactiveEffect _reactiveEffect;

  @override
  void initState() {
    super.initState();
    _reactiveEffect = ReactiveEffect(
        fn: () => widget.builder(),
        computed: () {
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return _reactiveEffect.run();
  }

  @override
  void dispose() {
    super.dispose();
    _reactiveEffect.dispose();
  }
}
