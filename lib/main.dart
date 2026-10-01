import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MoviesPage(),
    );
  }
}

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  final List<String> movies = const [
    "Breaking Bad",
    "Stranger Things",
    "Game of Thrones",
    "The Witcher",
    "Wednesday",
  ];

  final List<String> images = const [
    "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=400",
    "https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400",
    "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400",
    "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400",
    "https://images.unsplash.com/photo-1518930259200-8a5d6e0b2b1a?w=400",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
      ),

      body: ListView.builder(
        itemCount: movies.length,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(
                      title: movies[index],
                      image: images[index],
                    );
                  },
                ),
              );
            },

            child: Container(
              margin: EdgeInsets.all(10),

              child: Row(
                children: [
                  Image.network(
                    images[index],
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const SizedBox(
                      width: 100,
                      height: 120,
                      child: Icon(Icons.broken_image),
                    ),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      movies[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final String image;

  const DetailsPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Column(
        children: [
          Image.network(
            image,
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              height: 400,
              child: Center(child: Icon(Icons.broken_image, size: 80)),
            ),
          ),

          SizedBox(height: 20),

          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Details of $title",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}