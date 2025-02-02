import 'package:flutter/material.dart';

class ModalBottomSheet<T> extends Page<T> {
  const ModalBottomSheet({
    required this.builder,
    super.key,
  });
  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        builder: builder,
        isScrollControlled: false,
        settings: this,
      );
}
