import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/list_screen.dart';
import '../screens/about_screen.dart';

/// Drawer shared by all three screens for easy switching.
class AppDrawer extends StatelessWidget {
  final String current; // 'home', 'list' or 'about'
  const AppDrawer({super.key, required this.current});

  void _go(BuildContext context, String name, Widget screen) {
    Navigator.pop(context); // close the drawer
    if (name == current) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: current == 'home',
            onTap: () => _go(context, 'home', const HomeScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('List'),
            selected: current == 'list',
            onTap: () => _go(context, 'list', const ListScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            selected: current == 'about',
            onTap: () => _go(context, 'about', const AboutScreen()),
          ),
        ],
      ),
    );
  }
}
