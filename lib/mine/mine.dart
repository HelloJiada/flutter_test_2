import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  List menuTitles = [
    '个人信息',
    '我的订单',
    '邀请好友',
    '我的设置',
  ];

  List menuIcons = [
    Icons.message,
    Icons.local_mall_outlined,
    Icons.share,
    Icons.settings,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("个人中心"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              color: Colors.blue,
              height: 150.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://img.zcool.cn/community/0181115a50f66da8012180c50fd125.jpg@2o.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      onTap: () {
                        //执行
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "点击头像",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(menuTitles[index]),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: menuTitles.length + 1),
    );
  }
}
