import 'package:flutter/material.dart';
import 'package:flutter_mvvm/response/question.dart';
import 'package:flutter_mvvm/ui/details_view_model.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  static MaterialPageRoute route(Question question) =>
      MaterialPageRoute(builder: (_) => Details(question: question));

  final Question _question;

  const Details({Key? key, required Question question})
      : _question = question,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsViewModel(_question),
      child: _Details(),
    );
  }
}

class _Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: _Body(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_browser),
        onPressed: () => context.read<DetailsViewModel>().onFabTapped(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
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
              child: Selector<DetailsViewModel, String>(
                selector: (_, viewModel) => viewModel.title,
                builder: (_, title, __) => Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
