<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A Flex (i.e. Column or Row) that sizes itself to its main child in the cross axis direction.

## Features

This package contains three classes:
 - `FlexWithMainChild`
 - `ColumnWithMainChild`
 - `RowWithMainChild`

## Getting started

Add `flex_with_main_child: <version>` under `dependencies` in your `pubspec.yaml`.

## How it works

After it renders, it checks if the crossAxisSize of the flex is the same as the size obtain from `mainChildKey`. If not, it'll render again with the crossAxisSize set to the size previously measured from `mainChildKey`. It'll keep re-rendering until the size matches.

## Usage

The 3 classes' usage are exactly identical to their counterparts in flutter/widgets.dart, except they take in a mainChildKey which they will use to match their cross axis size to.

### Example

```dart
Widget build(BuildContext context) {
  final mainChildKey = GlobalKey();

  return ColumnWithMainChild(
    // ColumnWithMainChild have the same parameters as Column
    mainAxisAlignment: MainAxisAlignment.center,
    // except children, obviously.
    children: [
      // Because the underlying implementation uses Flex, any child that work
      // in Column will work exactly the same way in ColumnWithMainChild.
      Spacer(flex: 5),
      Text('very very very very long description'),
      Spacer(),
      Text(
        'short Title',
        key: mainChildKey, // you have to give mainChildKey to the main child
      ),
      Spacer(),
      Text('another very very very very very long text'),
      Spacer(flex: 10),
    ],
    mainChildKey: mainChildKey,
  );
}
```

The above code will give:
![example](https://raw.githubusercontent.com/chomosuke/flex_with_main_child/master/example.png)

## Additional information

Note that SizedBox will sometimes be forced to fit parent (e.g. when the parent is the screen). When this happens, place the FlexWithMainChild into a Center or some other intermediate containers. 

## Contribution & bug report

All pull requests / issues are welcome.
