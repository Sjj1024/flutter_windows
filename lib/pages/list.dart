import 'package:flutter/material.dart';
import 'package:flutter_windows/apis/app.dart';

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
    var res = await userApi.getGoods();
    var goodsData = res['response_data']['data'];
    setState(() {
      goods = goodsData;
    });
  }

  // 动态列表组件
  List<Widget> _getListData() {
    var tempList = goods.map((value) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
        child: Column(
          children: <Widget>[
            Image.network(
              value['skillurl'],
              width: 100,
              height: 200,
            ),
            const SizedBox(height: 12),
            Text(
              value['pordname'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
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
        children: goods.map((value) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
            child: Column(
              children: <Widget>[
                Image.network(
                  value['skillurl'],
                  width: 100,
                  height: 200,
                ),
                const SizedBox(height: 12),
                Text(
                  value['pordname'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
