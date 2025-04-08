import 'package:flutter/material.dart';
import 'services/appwrite_service.dart';

void main() {
  // Initialize Appwrite
  AppwriteService.instance;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 40, errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.image_not_supported);
        }),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: _selectedIndex == 0
            ? const Text('Home Screen')
            : const Text('Search Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              height: 24,
              color: _selectedIndex == 0 
                  ? Theme.of(context).colorScheme.primary 
                  : Colors.grey,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.home,
                  color: _selectedIndex == 0 
                      ? Theme.of(context).colorScheme.primary 
                      : Colors.grey,
                );
              },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/search.png',
              height: 24,
              color: _selectedIndex == 1 
                  ? Theme.of(context).colorScheme.primary 
                  : Colors.grey,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.search,
                  color: _selectedIndex == 1 
                      ? Theme.of(context).colorScheme.primary 
                      : Colors.grey,
                );
              },
            ),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
