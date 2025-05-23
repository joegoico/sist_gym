import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_widgets/custom_navigation_bar.dart';
import 'custom_widgets/custom_app_bar.dart';
import 'custom_widgets/custom_drawer.dart';
import 'package:sistema_gym/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? customBottomNavigationBar;
  final bool showSearchBar;
  final bool showDrawer;
  final Widget? leading;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.showSearchBar,
    required this.showDrawer,
    this.customBottomNavigationBar,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<AppThemeNotifier>(context);
    final theme = Theme.of(context);


    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      // AppBar común
      appBar: CustomAppBar(showSearchBar: showSearchBar, title: title, customLeading: leading),
      drawer: showDrawer?
        CustomDrawer()
        : null,
      body: child,
      bottomNavigationBar:
        CustomBottomNavigationBar(
        ),
    );
  }
}