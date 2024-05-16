import 'package:flutter/material.dart';
import 'package:grass_test/ui/screens/main_screen.dart';
import 'package:grass_test/ui/screens/ticket_history_screen.dart';
import 'ui/screens/organization_structure_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'grass_test_flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:
          // const CustomDialog(),
          // const TicketHistoryScreen(),
          // const StructureOrganizationScreen(),
          const MainMenuScreen(),
    );
  }
}
