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
    return Scaffold(
      body: Center(
        child: ImagesPageWords(),
      ),
    );
  }
}

class ImagesPageWords extends StatefulWidget {
  @override
  createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPageWords>
    with SingleTickerProviderStateMixin {
  List menuList = [];
  @override
  void initState() {
    super.initState();
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
    menuList.add('aaa');
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
                title: Text('我的相册'),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(1.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 0.99
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
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/timg.jpg',
                                      image: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed("/gallery");
                      },
                    );
                  },
                  childCount: menuList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
