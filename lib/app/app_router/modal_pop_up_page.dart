import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ModalPopupPage<T> extends Page<T> {
  const ModalPopupPage({
    required this.builder,
    this.anchorPoint,
    this.barrierDismissible = true,
    this.barrierLabel = 'Dismiss',
    this.barrierColor,
    this.semanticsDismissible = true,
    this.filter,
    super.key,
  });
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String barrierLabel;
  final bool semanticsDismissible;
  final WidgetBuilder builder;
  final ImageFilter? filter;

  @override
  Route<T> createRoute(BuildContext context) => CupertinoModalPopupRoute<T>(
        builder: builder,
        barrierDismissible: barrierDismissible,
        anchorPoint: anchorPoint,
        barrierLabel: barrierLabel,
        barrierColor: barrierColor,
        filter: filter,
        semanticsDismissible: semanticsDismissible,
        settings: this,
      );
}
