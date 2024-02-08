import 'package:examweekthree/model_class.dart';
import 'package:examweekthree/show_photo_details.dart';
import 'package:flutter/material.dart';

InkWell photoGalleryData(BuildContext context,List<Product> productList ,int index) {
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
            Text(productList[index].title ?? 'Unknow'),
          ],
        ),
      ),
    ),
  );
}
