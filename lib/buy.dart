import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shop/widgets/left_drawer.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add News Form',
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: $_title'),
                                        Text('Price: $_price'),
                                        Text('Description: $_content'),
                                        Text('Category: $_category'),
                                        Text('Thumbnail: $_thumbnail'),
                                        Text(
                                            'Is Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

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