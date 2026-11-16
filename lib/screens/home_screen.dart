import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'list_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bonus: CustomScrollView + SliverAppBar (collapsing header)
    return Scaffold(
      drawer: const AppDrawer(current: 'home'),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Home'),
              background: ColoredBox(color: Color(0xFF1B4F8A)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Icon(Icons.home_rounded,
                      size: 100, color: Colors.indigo),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome!',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Use the buttons below or open the drawer menu to move between screens.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.list),
                    label: const Text('Go to List Screen'),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ListScreen()),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.info),
                    label: const Text('Go to About Screen'),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutScreen()),
                    ),
                  ),
                  const SizedBox(height: 400), // extra space so scrolling is visible
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
