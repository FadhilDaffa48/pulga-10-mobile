import 'package:flutter/material.dart';
import 'package:football_shop/buy.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/product_entry_list.dart';
import 'package:football_shop/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({required theme,super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
              "images/pulga10.png",
              width: 50,
              height: 50,
            ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
        drawer: LeftDrawer(),
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

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewsEntryListPage()
                      ),
                    );
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
            ElevatedButton.icon(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text("Kamu telah menekan tombol My Products"),
                  duration: Duration(seconds: 3),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewsEntryListPage(filter: "mine"),
                  ),
                );
              },
              icon: ImageIcon(
                AssetImage('images/assist.png'),
                size: 50,
                color: Colors.black,
              ),
              label: Text("My Products", style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
            ),                const SizedBox(width: 16), // spacing between buttons
                ElevatedButton.icon(onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text("Kamu telah menekan tombol Create Products"),
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ShoppingPage()));
                },
                  icon: ImageIcon(
                    AssetImage('images/ref.png'),
                    size: 50,
                    color: Colors.black,
                  ),
                  label: Text("Create Products", style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.red),),
                ),
            const SizedBox(width: 16),
            ElevatedButton.icon(onPressed: () async {
              final snackBar = SnackBar(
                content: const Text("Logged out"),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              final response = await request.logout(
                  "http://localhost:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message See you again, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                }
              }
            },
              icon: Icon(
                Icons.door_front_door
              ),
              label: Text("Log out", style: TextStyle(color: Colors.black)),
              style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.red),),
            )

          ],
        ),
      )
    );
  }
}


