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
    List<FileSystemEntity>imageList;
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
  List<FileSystemEntity>imageList;
  GalleryPageWords(this.position,this.imageList);
  @override
  createState() => _GalleryPageState(position,imageList);
}

class _GalleryPageState extends State<GalleryPageWords>
    with SingleTickerProviderStateMixin {
  int position;
  List<FileSystemEntity>imageList;
  _GalleryPageState(this.position,this.imageList);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          pageController: PageController(initialPage: position),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered,
              imageProvider: FileImage(imageList[index]),
              heroAttributes: PhotoViewHeroAttributes(tag: imageList[index].path),
            );
          },
          itemCount: imageList.length,
          backgroundDecoration: BoxDecoration(color:Theme.of(context).scaffoldBackgroundColor),
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
