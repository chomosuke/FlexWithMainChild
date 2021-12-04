import './flex_with_main_child.dart';
import 'package:flutter/widgets.dart';

/// A widget that's identical to `Column` in `flutter/widgets.dart` except it
/// tries to match the its width with its `mainChild`.
class ColumnWithMainChild extends FlexWithMainChild {
  /// Identical constructor to `Column` in `flutter/widgets.dart`.
  const ColumnWithMainChild({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    required Widget mainChild,
    List<Widget> childrenAbove = const <Widget>[],
    List<Widget> childrenBelow = const <Widget>[],
  }) : super(
          key: key,
          direction: Axis.vertical,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          childrenBefore: childrenAbove,
          childrenAfter: childrenBelow,
          mainChild: mainChild,
        );
}
