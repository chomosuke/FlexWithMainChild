import 'package:flex_with_main_child/flex_with_main_child.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final mainChildKey = GlobalKey();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        // without Center, ColumnWithMainChild would have to be the same size of
        // the screen, making it useless.
        child: ColumnWithMainChild(
          // ColumnWithMainChild have the same parameters as Column
          mainAxisAlignment: MainAxisAlignment.center,
          // except children, obviously.
          children: [
            // Because the underlying implementation uses Flex, any child that work
            // in Column will work exactly the same way in ColumnWithMainChild.
            const Spacer(flex: 5),
            const Text('very very very very long description'),
            const Spacer(),
            Text(
              'short Title',
              key: mainChildKey,
            ),
            const Spacer(),
            const Text('another very very very very very long text'),
            const Spacer(flex: 10),
          ],
          mainChildKey: mainChildKey,
        ),
      ),
    );
  }
}
