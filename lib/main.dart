import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:valdb/models/agents_model.dart';
import 'package:valdb/pages/details_pages/agent_details.dart';
import 'package:valdb/pages/list_pages/agents_page.dart';
import 'package:valdb/pages/home_page.dart';
import 'package:valdb/pages/list_pages/buddies_page.dart';
import 'package:valdb/pages/list_pages/maps_page.dart';
import 'package:valdb/pages/list_pages/playercards_page.dart';
import 'package:valdb/pages/list_pages/weapons_page.dart';
import 'package:valdb/valdb_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        // List Pages
        Agents.routeName: (context) => const Agents(),
        Maps.routeName: (context) => const Maps(),
        Weapons.routeName: (context) => const Weapons(),
        Buddies.routeName: (context) => const Buddies(),
        PlayerCards.routeName: (context) => const PlayerCards(),

        // Details Page
        AgentDetails.routeName: (context) => AgentDetails(agent: AgentDetailModel()),
      },
    );
  }
}