import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation_test"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              // Handle next button press here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Women's Top",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/2.jpg'),
                ListTile(
                  title: Text("Product Name"),
                  subtitle: Text("Price: \$10\nRating: ⭐⭐⭐⭐"),
                  trailing: Icon(Icons.favorite),
                ),
                Image.asset('assets/3.png'),
                ListTile(
                  title: Text("Product Name"),
                  subtitle: Text("Price: \$10\nRating: ⭐⭐⭐⭐"),
                  trailing: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800]!,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.checkroom),
            icon: Icon(Icons.checkroom_outlined),
            label: 'Clothes',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}