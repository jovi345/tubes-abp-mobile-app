import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  final String title;

  ReviewsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ulasan untuk $title')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Berikan Ulasan untuk $title:'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tulis Ulasan...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed: () {
                // Simulasi pengiriman ulasan
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text('Ulasan Terkirim'),
                        content: Text('Ulasan untuk $title berhasil dikirim!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                );
              },
              child: Text('Kirim Ulasan'),
            ),
          ],
        ),
      ),
    );
  }
}
