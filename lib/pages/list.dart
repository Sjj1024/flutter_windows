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
    try {
      var res = await userApi.getGoods();
      var goodsData = res['response_data']['data'];
      setState(() {
        goods = goodsData ??
            [
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
              {
                "pordname": "11111111111",
                "skillurl":
                    "https://img-blog.csdnimg.cn/67fc9799ae8e48749e82cf70b179895b.png"
              },
            ];
      });
    } catch (e) {
      print("发送请求异常：$e");
    }
    //
    Future.delayed(Duration(seconds: 3), () {
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

  final innerController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("产品列表"),
      ),
      body: Scrollbar(
          controller: innerController,
          child: SingleChildScrollView(
            controller: innerController,
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 1920,
              height: 100,
              color: Colors.red,
              child: Text(
                  "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"),
            ),
          )),
    );
  }
}
