import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("产品列表"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("数据列表"),
          )
        ],
      ),
    );
  }
}
