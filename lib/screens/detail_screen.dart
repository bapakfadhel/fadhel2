import 'package:flutter/material.dart';
import 'package:flutter_demo_riverpod/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  static String routeName = '/detail_screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button in the previous screen this many times:',
            ),
            Consumer(
              builder: (context, watch, _) {
                final counter = watch(counterProvider).getCounter();
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.read(counterProvider).resetCounter(),
              child: const Text('Clear Data ygy'),
            ),
          ],
        ),
      ),
    );
  }
}
