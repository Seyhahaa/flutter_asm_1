import 'package:flutter/material.dart';

class InstagramSearchScreen extends StatefulWidget {
  @override
  _InstagramSearchScreenState createState() => _InstagramSearchScreenState();
}

class _InstagramSearchScreenState extends State<InstagramSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchHistory = [];
  final List<String> _suggestedAccounts = [
    'user1', 'user2', 'user3', 'user4', 'user5'
  ];

  void _performSearch(String query) {
    if (query.isNotEmpty && !_searchHistory.contains(query)) {
      setState(() {
        _searchHistory.insert(0, query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    )
                  : null,
                filled: true,
                //fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: _performSearch,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Search History Section
          if (_searchHistory.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Searches',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ...List.generate(_searchHistory.take(5).length, (index) {
                    return ListTile(
                      leading: Icon(Icons.history),
                      title: Text(_searchHistory[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _searchHistory.removeAt(index);
                          });
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),

          // Suggested Accounts Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suggested Accounts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _suggestedAccounts.map((account) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              //backgroundColor: Colors.grey[300],
                              child: Text(
                                account[0].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 24,
                                  //color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(account),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}