import 'package:flutter/material.dart';
import 'package:flutter_mvvm/response/question.dart';

class Details extends StatelessWidget {
  static MaterialPageRoute route(Question question) =>
      MaterialPageRoute(builder: (_) => Details(question: question));

  final Question _question;

  const Details({Key? key, required Question question})
      : _question = question,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Details(question: _question);
  }
}

class _Details extends StatelessWidget {
  final Question _question;

  const _Details({Key? key, required Question question})
      : _question = question,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: _Body(question: _question),
    );
  }
}

class _Body extends StatelessWidget {
  final Question _question;

  const _Body({Key? key, required Question question})
      : _question = question,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                _question.title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
