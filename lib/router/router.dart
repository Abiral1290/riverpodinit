import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodinit/ui/home_page.dart';

final _router = GoRouter(
    routes: [
      GoRoute(
          path: "/",
          builder: (context, state) => HomePage()
      ),
      GoRoute(
          path: "/",
          builder: (context, state) => HomePage()
      )
    ]
);