import 'package:flutter/material.dart';

class PhotoItem {
  final String image;
  PhotoItem(this.image);
}

class PropertyPhotos extends StatelessWidget {
  final List<PhotoItem> _items = [
    PhotoItem("https://picsum.photos/200/300?random=1"),
    PhotoItem("https://picsum.photos/200/300?random=2"),
    PhotoItem("https://picsum.photos/200/300?random=3"),
    PhotoItem("https://picsum.photos/200/300?random=4"),
    PhotoItem("https://picsum.photos/200/300?random=5"),
    PhotoItem("https://picsum.photos/200/300?random=6"),
    PhotoItem("https://picsum.photos/200/300?random=7"),
    PhotoItem("https://picsum.photos/200/300?random=8"),
    PhotoItem("https://picsum.photos/200/300?random=9"),
    PhotoItem("https://picsum.photos/200/300?random=10"),
    PhotoItem("https://picsum.photos/200/300?random=11"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos️'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RouteTwo(image: _items[index].image, name: ""),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_items[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;

  RouteTwo({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                width: double.infinity,
                child: Image(
                  image: NetworkImage(image),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
