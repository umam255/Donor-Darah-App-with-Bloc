import 'package:donor_darah/utility/auth/authState.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool> myMiddleware(
  BuildContext context,
  GoRouterState state,
  Function navigate,
  Function() refresh,
) async {
  bool isAuthenticated = await checkAuthentication();

  return isAuthenticated;
}
