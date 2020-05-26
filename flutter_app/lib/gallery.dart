import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
class GalleryPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GalleryPageWords(),
      ),
    );
  }
}

class GalleryPageWords extends StatefulWidget {
  @override
  createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPageWords>
    with SingleTickerProviderStateMixin {
  List menuList = [];
  @override
  void initState() {
    super.initState();
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
    menuList.add('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              maxScale: 3.0,
              minScale: 0.5,
              imageProvider: AssetImage("assets/timg.jpg"),

            );
          },
          itemCount: menuList.length,
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
