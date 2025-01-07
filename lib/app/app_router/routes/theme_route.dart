import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/app/app_router/modal_pop_up_page.dart';
import 'package:swiftify/theme/view/theme_bottom_sheet.dart';

final themeRoute = AppRoute(
  parentNavigatorKey: rootNavigatorKey,
  name: ThemeBottomSheet.routeName,
  path: ThemeBottomSheet.routeName,
  pageBuilder: (context, state) => ModalPopupPage<void>(
    builder: (context) => ThemeBottomSheet.pageBuilder(context, state),
  ),
);
