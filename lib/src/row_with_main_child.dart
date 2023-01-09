import 'package:flutter/rendering.dart';

import 'flex_with_main_child.dart';

class RowWithMainChild extends FlexWithMainChild {
  RowWithMainChild({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    super.children,
  }) : super(
    direction: Axis.horizontal,
  );
}
