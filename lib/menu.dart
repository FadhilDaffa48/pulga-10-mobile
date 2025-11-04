import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required theme,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
              "images/pulga10.png",
              width: 50,
              height: 50,
            ),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                ElevatedButton.icon(onPressed: () {
                    final snackBar = SnackBar(
                    content: const Text("Kamu telah menekan tombol All Products"),
                    duration: Duration(seconds: 3),
                  );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                  icon: ImageIcon(
                      AssetImage('images/ball.png'),
                      size: 50,
                      color: Colors.black,
                  ),
                  label: Text("All Products", style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.blue),),
                ),
                const SizedBox(width: 16), // spacing between buttons
                ElevatedButton.icon(onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text("Kamu telah menekan tombol My Products"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                  icon: ImageIcon(
                    AssetImage('images/assist.png'),
                    size: 50,
                    color: Colors.black,
                  ),
                  label: Text("All Products", style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.green),),
                ),
                const SizedBox(width: 16), // spacing between buttons
                ElevatedButton.icon(onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text("Kamu telah menekan tombol Create Products"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                  icon: ImageIcon(
                    AssetImage('images/ref.png'),
                    size: 50,
                    color: Colors.black,
                  ),
                  label: Text("Create Products", style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.red),),
                )
          ],
        ),
      )
    );
  }
}
