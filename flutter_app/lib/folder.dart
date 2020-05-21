import 'package:flutter/material.dart';

class FolderPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FolderPageWords(),
      ),
    );
  }
}

class FolderPageWords extends StatefulWidget {
  @override
  createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPageWords>
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: false,
              expandedHeight: 250.0,
              floating: false,
              snap: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('我的相册',style: TextStyle(color: Colors.black87),),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 16, left: 16),
                            child: ClipOval(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/timg.jpg',
                                image: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              ),
                            ))
                      ],
                    ),
                  );
                },
                childCount: menuList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
