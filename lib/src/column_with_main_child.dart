import 'package:flutter/rendering.dart';

import 'flex_with_main_child.dart';

class ColumnWithMainChild extends FlexWithMainChild {
  ColumnWithMainChild({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(
    direction: Axis.vertical,
  );
}
