import 'package:flutter/material.dart';
import 'package:flutter_windows/apis/app.dart';
import 'package:get/get.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // 初始化数据状态
  List imgList = [];
  var imgId = "";

  // 初始化生命周期
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 发送请求获取详情数据
    getDetails();
  }

  // 封装获取数据的函数
  void getDetails() async {
    // 发送请求获取数据
    // var res = await userApi.getDetail();
    // var imgData = res["response_data"]["data"];
    // print("获取到的详情数据: ${imgData}");
    var imgData = [
      {
        "pordname": "图片列表1",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10003.jpeg"
      },
      {
        "pordname": "图片列表2",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10004.jpeg"
      },
      {
        "pordname": "图片列表3",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10005.jpeg"
      },
      {
        "pordname": "图片列表4",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10006.jpeg"
      },
      {
        "pordname": "图片列表5",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10007.jpeg"
      },
      {
        "pordname": "图片列表6",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10008.jpeg"
      },
      {
        "pordname": "图片列表7",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10009.jpeg"
      },
      {
        "pordname": "图片列表8",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10009.jpeg"
      },
      {
        "pordname": "图片列表9",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10009.jpeg"
      },
      {
        "pordname": "图片列表10",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10009.jpeg"
      },
      {
        "pordname": "图片列表11",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10009.jpeg"
      },
      {
        "pordname": "图片列表12",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/10009.jpeg"
      },
      {
        "pordname": "图片列表13",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/100017.jpeg"
      },
      {
        "pordname": "图片列表14",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/100018.jpeg"
      },
      {
        "pordname": "图片列表15",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/100019.jpeg"
      },
      {
        "pordname": "图片列表16",
        "skillurl":
            "https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/picture/100020.jpeg"
      },
    ];
    // 获取页面传递过来的参数
    var args = Get.arguments;
    print("路由传递过来的参数: $args");
    setState(() {
      imgList.addAll(imgData);
      imgId = args['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // 详情页面组件
    return Scaffold(
      appBar: AppBar(
        title: Text("产品详情参数: ${imgId}"),
      ),
      body: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // 设置为1，表示横向滚动
          mainAxisSpacing: 8.0, // 主轴（横轴）间距
        ),
        itemCount: 10, // 你的横向项的数量
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200.0,
            color: Colors.blue,
            margin: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Item $index'),
            ),
          );
        },
      ),
    );
  }
}
