import 'package:flutter/material.dart';

typedef Build = Widget Function(BuildContext context);
typedef Initialize = void Function(BuildContext context);

class Initializer extends StatefulWidget {
  final Initialize _init;
  final Build _build;

  const Initializer({
    Key? key,
    required Initialize init,
    required Build build,
  })   : _init = init,
        _build = build,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _InitializerContent(_init, _build);
}

class _InitializerContent extends State<Initializer> {
  final Initialize _init;
  final Build _build;

  _InitializerContent(this._init, this._build);

  @override
  void initState() {
    super.initState();
    _init(context);
  }

  @override
  Widget build(BuildContext context) => _build(context);
}
