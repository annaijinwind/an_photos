import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
class GalleryPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context).settings.arguments;
    int position;
    List imageList;
    if(arg is Map){
      Map<String,Object>data=arg;
      position=data['position'];
      imageList=data['imageList'];
    }
    return Scaffold(
      body: Center(
        child: GalleryPageWords(position,imageList),
      ),
    );
  }
}

class GalleryPageWords extends StatefulWidget {
  int position;
  List imageList;
  GalleryPageWords(this.position,this.imageList);
  @override
  createState() => _GalleryPageState(position,imageList);
}

class _GalleryPageState extends State<GalleryPageWords>
    with SingleTickerProviderStateMixin {
  int position;
  List imageList;
  _GalleryPageState(this.position,this.imageList);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
//  Image.file(imageList[index],
//  cacheWidth: (MediaQuery.of(context).size.width.toInt())*2),
//  tag: index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          pageController: PageController(initialPage: position),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: 2.0,
              imageProvider: ResizeImage(FileImage(imageList[index].data),
              width:  (MediaQuery.of(context).size.width.toInt())*2
              ),
              heroAttributes: PhotoViewHeroAttributes(tag: imageList[index].tag),
            );
          },
          itemCount: imageList.length,
          enableRotation: true,
          onPageChanged: (index){
            setState(() {
            });
          },
        ),
      ),
    );
  }

}
