import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> _searchResults = [];

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      // This is a placeholder for actual search functionality
      // You can replace this with your actual search logic
      _searchResults = [
        'Result 1 for: $query',
        'Result 2 for: $query',
        'Result 3 for: $query',
      ];
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
            onChanged: _performSearch,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _searchQuery.isEmpty
                ? const Center(
                    child: Text(
                      'Start typing to search',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(_searchResults[index]),
                          onTap: () {
                            // Handle result selection
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
} 