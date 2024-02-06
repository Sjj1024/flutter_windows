import 'package:flutter/material.dart';
import 'package:flutter_windows/apis/app.dart';
import 'package:flutter_windows/components/loading.dart';
import 'package:get/get.dart';

class Lists extends StatefulWidget {
  const Lists({super.key});

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  // 列表数据
  List goods = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 获取商品列表
    getGoods();
  }

  // 获取列表
  getGoods() async {
    // var res = await userApi.getGoods();
    var goodsData = [
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
    setState(() {
      goods = goodsData;
    });
    //
    Future.delayed(Duration(seconds: 2), () {
      print("退出加载...");
      // Get.back();
      LoadingDialog.hide();
    });
  }

  // 动态列表组件
  List<Widget> _getListData() {
    // LoadingDialog.hide();
    var tempList = goods.map((value) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
        child: Column(
          children: <Widget>[
            Image.network(
              value['skillurl'],
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 12),
            Text(
              value['pordname'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      );
    }); // ('xxx','xxx')
    print("渲染的列表组件类型：${tempList.toList().runtimeType}");
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("产品列表"),
      ),
      body: GridView.count(
        crossAxisSpacing: 10.0,
        //水平子 Widget 之间间距
        mainAxisSpacing: 10.0,
        //垂直子 Widget 之间间距
        padding: const EdgeInsets.all(2),
        crossAxisCount: 4,
        //一行的 Widget 数量
        // childAspectRatio: 0.7,
        //宽度和高度的比例
        children: _getListData(),
      ),
    );
  }
}
