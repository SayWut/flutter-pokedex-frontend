import 'package:flutter/material.dart';
import 'package:flutter_pokedex_frontend/core/widgets/my_app_bar.dart';
import 'package:flutter_pokedex_frontend/routes/app_pages.dart';
import 'package:get/get.dart';

import 'core/widgets/my_drawer.dart';

class RootView extends GetView {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: const MyAppBar(),
          body: GetRouterOutlet(
            anchorRoute: Routes.POKEMONS,
            initialRoute: Routes.POKEMONS,
          ),
        );
      },
    );
  }
}
