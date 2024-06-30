import 'package:flutter/material.dart';
import "./index.dart";

class Effect extends StatefulWidget {
  const Effect(this.builder, {super.key});

  final Widget Function() builder;

  @override
  State<Effect> createState() => _EffectState();
}

class _EffectState extends State<Effect> with ReactiveEffectMixin<Effect> {
  @override
  void initState() {
    super.initState();
    reactiveEffect = ReactiveEffect(
        fn: widget.builder,
        computed: () {
          setState(() {});
        });
  }
}

mixin ReactiveEffectMixin<T extends StatefulWidget> on State<T> {
  late ReactiveEffect reactiveEffect;

  @override
  Widget build(BuildContext context) {
    return reactiveEffect.run();
  }

  @override
  void dispose() {
    reactiveEffect.dispose();
    super.dispose();
  }
}
