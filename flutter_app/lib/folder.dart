import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photos/model/folder_data.dart';
import 'package:photos/model/image_data.dart';
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
  List<FolderData> folderList = [];
  @override
  void initState() {
    super.initState();
    requestPermission().then((value) => readFromLocal());
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
              expandedHeight: 250.0,
              floating: false,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('我的相册'),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (MediaQuery.of(context).size.width/2),
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 0.75
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: (MediaQuery.of(context).size.width/2)-16,
                                height: (MediaQuery.of(context).size.width/2)-16,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(
                                        folderList[index].icon,
                                        fit: BoxFit.cover,
                                        cacheHeight: (MediaQuery.of(context).size.width)~/2+100,
                                        filterQuality:FilterQuality.low
                                    )
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(folderList[index].name),
                            ),
                            Opacity(
                                opacity: 0.6,
                                child:Text(folderList[index].count.toString())
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/images",arguments:<String, Object>{
                          'folderName': folderList[index].name,
                          'imageList': folderList[index].imageList,
                        });
                      },
                    );
                  },
                  childCount: folderList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<List<FileSystemEntity>> readFromLocal() async {
    var path = await ExtStorage.getExternalStorageDirectory();
    var directory = Directory(path).listSync();
    setState(() {
    });
    for(var data in directory){
      if(FileSystemEntity.isDirectorySync(data.path)){
        FolderData foldData=new FolderData();
        List<FileSystemEntity> childList=Directory(data.path).listSync();

        List<ImageData> imageList=[];
        for(var file in childList){
          if(file.path.indexOf(".jpg")!=-1||
              file.path.indexOf(".png")!=-1||
              file.path.indexOf(".gif")!=-1){
            ImageData imageData=new ImageData();
            imageData.data=file;
            imageData.tag=file.path;
            imageList.add(imageData);
          }
        }
        foldData.count=imageList.length;
        if(imageList.length>0){
          foldData.name=data.path.split('/').last;
          foldData.icon=imageList[0].data;
          foldData.imageList=imageList;
          setState(() {
            folderList.add(foldData);
          });
        }
      }
    }
    return Future.value(directory);
  }
  Future requestPermission() async {
    // 申请权限
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if(statuses[Permission.storage]==PermissionStatus.granted){
      return Future.value();
    }
  }
}
