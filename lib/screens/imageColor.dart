import 'package:flutter/material.dart';

class ImageColor extends StatefulWidget {
  const ImageColor({super.key});

  @override
  State<ImageColor> createState() => _ImageColorState();
}

class _ImageColorState extends State<ImageColor> {
  late Color color = Colors.orange;

  Widget makeColor( Color color) {
    return GestureDetector(
      onTap: () {
        this.color = color;
        setState(() {});
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Image Color"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/image.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.colorBurn,
              color: color,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeColor(Colors.red),
                const SizedBox(
                  width: 10,
                ),
                makeColor(Colors.green),
                const SizedBox(
                  width: 10,
                ),
                makeColor(Colors.blue)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
