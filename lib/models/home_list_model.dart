import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/akar_icons.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';
import 'package:iconify_flutter/icons/pepicons.dart';
import 'package:valdb/pages/list_pages/agents_page.dart';
import 'package:valdb/pages/list_pages/buddies_page.dart';
import 'package:valdb/pages/list_pages/playercards_page.dart';
import 'package:valdb/pages/list_pages/weapons_page.dart';

import '../pages/list_pages/maps_page.dart';

 // widget

class HomeListOption {
  final String name;
  final Iconify icon;
  final String routeName;
  HomeListOption ({
    required this.routeName,
    required this.icon,
    required this.name,
  });

  static List<HomeListOption> option = [
    HomeListOption(
      name: 'Agents',
      icon: const Iconify(Bi.people_fill),
      routeName: Agents.routeName,
    ),
    HomeListOption(
      name: 'Maps',
      icon: const Iconify(Bi.map_fill),
      routeName: Maps.routeName,
    ),
    HomeListOption(
      name: 'Weapons',
      icon: const Iconify(Fa6Solid.gun),
      routeName: Weapons.routeName,
    ),
    HomeListOption(
      name: 'Buddies',
      icon: const Iconify(AkarIcons.link_chain),
      routeName: Buddies.routeName,
    ),
    HomeListOption(
      name: 'Player Cards',
      icon: const Iconify(Mdi.cards_playing_outline) ,
      routeName: PlayerCards.routeName,
    ),
  ];
}
