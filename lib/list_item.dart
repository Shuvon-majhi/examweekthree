import 'dart:convert';
import 'package:examweekthree/model_class.dart';
import 'package:examweekthree/photo_gallery_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class listItem extends StatefulWidget {
  const listItem({super.key});

  @override
  State<listItem> createState() => _listItemState();
}

class _listItemState extends State<listItem> {
  // Create a list to store api get data
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    _getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: Visibility(
        visible: _inProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return photoGalleryData(context, productList, index);
          },
        ),
      ),
    );
  }

  // fetch the data from API
  Future<void> _getDataFromApi() async {
    _inProgress = true;
    setState(() {});

    // Make url
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    // api call
    Response response = await get(uri);

    if (response.statusCode == 200) {
      productList.clear();
      // decode the data from response body
      var decodeResponse = jsonDecode(response.body);
      for (var item in decodeResponse) {
        Product product = Product.fromJson(item);
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }
}
