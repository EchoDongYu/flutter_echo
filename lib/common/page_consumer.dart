import 'package:flutter/material.dart';
import 'package:flutter_echo/common/base_provider.dart';
import 'package:flutter_echo/ui/dialogs/loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PageConsumer<T extends BaseProvider> extends StatelessWidget {
  final Widget? _child;

  const PageConsumer({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final loading = provider.loading;
          if (loading != null) {
            final showLoading = loading.value;
            if (showLoading) {
              LoadingDialog.show(context);
            } else {
              final navigator = Navigator.of(context, rootNavigator: true);
              if (navigator.canPop()) navigator.pop();
            }
            provider.loading = null;
          }
          final route = provider.navRoute;
          if (route != null) {
            context.push(route);
            provider.navRoute = null;
          }
        });
        return child!;
      },
      child: _child,
    );
  }
}
