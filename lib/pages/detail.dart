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
    var res = await userApi.getDetail();
    var imgData = res["response_data"]["data"];
    print("获取到的详情数据: ${imgData}");
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
    // 获取页面传递过来的参数
    // var args = Get.arguments;
    // print("传递过来的参数: $args");
    // // 提取参数
    // var id = args['id'];
    // // 获取路径参数并设置
    // setState(() {
    //   imgId = id;
    // });
    // 详情页面组件
    return Scaffold(
      appBar: AppBar(
        title: Text("产品详情参数: ${imgId}"),
      ),
      body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("${imgList[index]['pordname']}"),
              subtitle: Text("${imgList[index]['proddetail']}"),
              leading: Image.network("${imgList[index]['skillurl']}"),
            );
          }),
    );
  }
}
