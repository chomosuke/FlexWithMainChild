import 'package:flutter/widgets.dart';

/// A widget that's identical to `Flex` in `flutter/widgets.dart` except it
/// tries to match the its cross axis size with its `mainChild`.
/// `mainChild` must have a GlobalKey attached for size measuring.
class FlexWithMainChild extends StatefulWidget {
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final List<Widget> children;
  final GlobalKey mainChildKey;

  /// Identical constructor to `Flex` in `flutter/widgets.dart`.
  const FlexWithMainChild({
    Key? key,
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    required this.children,
    required this.mainChildKey,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FlexWithMainChildState();
}

class _FlexWithMainChildState extends State<FlexWithMainChild> {
  double? crossAxisSize;

  @override
  Widget build(BuildContext context) {
    _ambiguate(WidgetsBinding.instance)!.addPostFrameCallback((_) {
      final double crossAxisSize;
      if (widget.direction == Axis.vertical) {
        crossAxisSize = (widget.mainChildKey.currentContext!.findRenderObject()!
                as RenderBox)
            .size
            .width;
      } else {
        crossAxisSize = (widget.mainChildKey.currentContext!.findRenderObject()!
                as RenderBox)
            .size
            .height;
      }
      if (this.crossAxisSize != crossAxisSize) {
        setState(() {
          this.crossAxisSize = crossAxisSize;
        });
      }
    });
    return SizedBox(
      width: widget.direction == Axis.vertical ? crossAxisSize : null,
      height: widget.direction == Axis.horizontal ? crossAxisSize : null,
      child: _getFlex(),
    );
  }

  Widget _getFlex() => Flex(
        direction: widget.direction,
        mainAxisAlignment: widget.mainAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        // this is to combat CrossAxisAlignment.stretch
        // which forces child to take up all the space
        crossAxisAlignment: widget.crossAxisAlignment,
        textDirection: widget.textDirection,
        verticalDirection: widget.verticalDirection,
        textBaseline: widget.textBaseline,
        clipBehavior: widget.clipBehavior,
        children: widget.children,
      );

  /// credit: https://github.com/CoderUni/responsive_sizer/commit/e6bb1643b8769c951eeeac5d7dc8d198fc5ce6a6#diff-0730f7244987f77976094a672f55f4401ca3cd433c91e8dcfe8ab7c1525fa620
  /// This allows a value of type T or T?
  /// to be treated as a value of type T?.
  ///
  /// We use this so that APIs that have become
  /// non-nullable can still be used with `!` and `?`
  /// to support older versions of the API as well.
  static T? _ambiguate<T>(T? value) => value;
}
