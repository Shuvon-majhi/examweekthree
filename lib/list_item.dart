import 'dart:convert';
import 'package:examweekthree/model_class.dart';
import 'package:examweekthree/show_photo_details.dart';
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
  bool inProgress = false;

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
        visible: inProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return photoGalleryData(context, index);
          },
        ),
      ),
    );
  }

  InkWell photoGalleryData(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => showPhotoDetails(
              title: productList[index].title,
              id: productList[index].id,
              url: productList[index].url,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.network(productList[index].thumbnailUrl ?? ''),
          title: Wrap(
            children: [
              Text(productList[index].title ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  // fetch the data from API
  Future<void> _getDataFromApi() async {
    inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      productList.clear();
      var decodeResponse = jsonDecode(response.body);
      for (var item in decodeResponse) {
        Product product = Product.fromJson(item);
        productList.add(product);
        //setState(() {});
      }
    }
    inProgress = false;
    setState(() {});
  }
}
