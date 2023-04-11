import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  bool _isEdit = false;

  var chekOutProVider;

  @override
  Widget build(BuildContext context) {
    List<String> cartProvider = ["1", "1", "1", "1"];
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.launch))],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Column(
                    children: cartProvider.map((e) {
                      return CartItem();
                    }).toList(),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(80),
                  )
                ],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            width: ScreenUtil().setWidth(375),
            height: ScreenUtil().setHeight(50),
              child: Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.black12),
                ),
                color: Colors.white),
            width: ScreenUtil().setWidth(375),
            height: ScreenUtil().setWidth(78),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(60),
                        child: Checkbox(
                            value: false,
                            activeColor: Colors.pink,
                            onChanged: (v) {}),
                      ),
                      Text("全选"),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "结算",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),//iterm的高度
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(60),
            child: Checkbox(
              // value: _itemData["checked"],
              onChanged: (val) {},
              activeColor: Colors.pink, value: false,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(100),
            child: Image.network(
              "https://img.alicdn.com/imgextra/i4/21944353/O1CN01kW6uUw1i1irxONHBK_!!21944353.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "万代 限定 PG 1/60 红色异端高达改电镀骨架外装透明版",
                      maxLines: 2,
                    ),
                    Text(
                      "玩具系列: PG版",
                      maxLines: 2,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥3650.00-3686.00",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
