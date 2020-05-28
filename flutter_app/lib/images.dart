import 'dart:io';

import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({
    this.imageProvider,//图片
    this.loadingChild,//加载时的widget
    this.backgroundDecoration,//背景修饰
    this.minScale,//最大缩放倍数
    this.maxScale,//最小缩放倍数
    this.heroTag,//hero动画tagid
  });
  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context).settings.arguments;
    String folderName;
    List imageList;
    if(arg is Map){
      Map<String,Object>data=arg;
      folderName=data['folderName'];
      imageList=data['imageList'];
    }
    return Scaffold(
      body: Center(
        child: ImagesPageWords(folderName,imageList),
      ),
    );
  }
}

class ImagesPageWords extends StatefulWidget {
  String folderName;
  List imageList;
  ImagesPageWords(this.folderName,this.imageList);
  @override
  createState() => _ImagesPageState(folderName,imageList);
}

class _ImagesPageState extends State<ImagesPageWords>
    with SingleTickerProviderStateMixin {
  String folderName;
  List imageList;
  _ImagesPageState(this.folderName,this.imageList);
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(folderName),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(1.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 0.98
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: ClipRRect(
                                    child:Hero(tag: imageList[index].tag, child: Image.file(
                                      imageList[index].data,
                                      fit: BoxFit.cover,
                                      width: (MediaQuery.of(context).size.width)/4,
                                      height: (MediaQuery.of(context).size.width)/4,
                                      cacheHeight: (MediaQuery.of(context).size.width)~/2,
                                      errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                                        return Image.asset("assets/timg.jpg",width: 110,height: 110);
                                      },
                                    ))
                                )
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed("/gallery",arguments:<String, Object>{
                          'position': index,
                          'imageList': imageList
                        });
                      },
                    );
                  },
                  childCount: imageList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
