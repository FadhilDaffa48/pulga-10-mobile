import 'package:flutter/material.dart';
import 'package:football_shop/buy.dart';
import 'package:football_shop/menu.dart';
import 'package:football_shop/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Pulga 10 Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Your Messi Collection Hub",
                  // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(theme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent)),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Products'),
            // Bagian redirection ke NewsFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke NewsFormPage di sini,
              setelah halaman NewsFormPage sudah dibuat.
              */
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShoppingPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Products List'),
            onTap: () {
              // Route to news list page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsEntryListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}