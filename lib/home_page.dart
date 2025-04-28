import 'package:flutter/material.dart';
import 'wishlist.dart';
import 'reviews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<String> wishlist = [];
  List<Map<String, String>> paketWisata = [
    {
      'title': 'Pantai Kuta Bali',
      'description': 'Salah satu pantai terkenal di Bali.',
    },
    {
      'title': 'Gunung Bromo Jawa Timur',
      'description': 'Gunung berapi terkenal dengan sunrise-nya.',
    },
    {
      'title': 'Danau Toba Sumatera Utara',
      'description': 'Danau vulkanik terbesar di Indonesia.',
    },
  ];

  List<Map<String, String>> filteredPaketWisata = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPaketWisata = paketWisata;
    searchController.addListener(_filterPaketWisata);
  }

  void _filterPaketWisata() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredPaketWisata = paketWisata;
      } else {
        filteredPaketWisata =
            paketWisata
                .where(
                  (paket) => paket['title']!.toLowerCase().contains(
                    searchController.text.toLowerCase(),
                  ),
                )
                .toList();
      }
    });
  }

  void toggleWishlist(String title) {
    setState(() {
      if (wishlist.contains(title)) {
        wishlist.remove(title);
      } else {
        wishlist.add(title);
      }
    });
  }

  void navigateToReviews(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewsScreen(title: title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomend Paket Wisata'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(wishlist: wishlist),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Cari Paket Wisata',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPaketWisata.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(filteredPaketWisata[index]['title']!),
                    subtitle: Text(filteredPaketWisata[index]['description']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            wishlist.contains(
                                  filteredPaketWisata[index]['title']!,
                                )
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                wishlist.contains(
                                      filteredPaketWisata[index]['title']!,
                                    )
                                    ? Colors.red
                                    : null,
                          ),
                          onPressed: () {
                            toggleWishlist(
                              filteredPaketWisata[index]['title']!,
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {
                            navigateToReviews(
                              filteredPaketWisata[index]['title']!,
                            );
                          },
                        ),
                      ],
                    ),
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
