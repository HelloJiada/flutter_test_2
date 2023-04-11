import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("消息中心"),
      ),
      body: Center(
        child: makeBody,
      ),
    );
  }
}

final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ),
);

final makeCard = Card(
  elevation: 8.0,
  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Colors.white),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.black))),
      child: Icon(Icons.notifications_none, color: Colors.black38),
    ),
    title: Text(
      "万代 PG 1/60 高达00R RAISER 升降机装备 双零升降机 拼装模型",
      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 17),
    ),
    subtitle: Row(
      children: <Widget>[
        Text("您的商品已经发货啦~", style: TextStyle(color: Colors.black54,fontSize: 14))
      ],
    ),
    trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.black87, size: 20.0));
