import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/menu.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";
  String _category = "Jersey"; // default
  String _thumbnail = "";
  int _price = 0;
  bool _isFeatured = false; // default

  final List<String> _categories = [
    'Jersey',
    'Shoes',
    'Poster',
    'Miniatures',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Products Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
            // === Name ===
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Product Name",
                labelText: "Product Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _title = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: 'Enter a positive number',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // ✅ only allow digits 0–9
                      ],
                      onChanged: (value) {
                        setState(() {
                          _price = int.tryParse(value) ?? 0;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        final parsed = int.tryParse(value);
                        if (parsed == null) {
                          return 'Only numbers are allowed';
                        }
                        if (parsed <= 0) {
                          return 'Price must be greater than 0';
                        }
                        return null;
                      },
                    )
                  ),
                  // === Content ===
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Product description",
                labelText: "Product description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _content = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Isi deskripsi tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),

          // === Category ===
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              initialValue: _category,
              items: _categories
                  .map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(
                    cat[0].toUpperCase() + cat.substring(1)),
              ))
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _category = newValue!;
                });
              },
            ),
          ),

          // === Thumbnail URL ===
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "URL Thumbnail (opsional)",
                labelText: "URL Thumbnail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _thumbnail = value!;
                });
              },
            ),
          ),

          // === Is Featured ===
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              title: const Text("Hot Product"),
              value: _isFeatured,
              onChanged: (bool value) {
                setState(() {
                  _isFeatured = value;
                });
              },
            ),
          ),    // === Tombol Simpan ===
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          WidgetStatePropertyAll(Colors.cyanAccent),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Replace the URL with your app's URL
                            // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                            // If you using chrome,  use URL http://localhost:8000

                            final response = await request.postJson(
                              "http://localhost:8000/create-flutter/",
                              jsonEncode({
                                "title": _title,
                                "content": _content,
                                "thumbnail": _thumbnail,
                                "category": _category,
                                "price": _price,
                                "is_featured": _isFeatured,
                              }),
                            );
                            if (context.mounted) {
                              if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Products successfully saved!"),
                                ));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(theme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                                          .copyWith(secondary: Colors.blueAccent[400])),
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Something went wrong, please try again."),
                                ));
                              }
                            }
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
          ),
      )
    )
    );
  }
}