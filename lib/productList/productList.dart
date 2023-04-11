import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;
  List _lefCateList = ["1", "2"];
  List _rightCateList = ["1", "2"];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _leftCateWidget(leftWidth) {
    if (_lefCateList.length > 0) {
      return Container(
        width: leftWidth,
        height: double.infinity,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectIndex = index;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(60),
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                      child: Text(
                        "商品",
                        textAlign: TextAlign.center,
                      ),
                      color: _selectIndex == index
                          ? Color.fromRGBO(240, 246, 246, 0.9)
                          : Colors.white,
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              );
            }),
      );
    } else {
      return Container(
        width: leftWidth,
        height: double.infinity,
      );
    }
  }

  Widget _rightCateWidget(rightItemWidth, rightItemHeight) {
    if (_rightCateList.length > 0) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          color: Color.fromRGBO(240, 246, 246, 0.9),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 9 / 16,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              String pic =
                  "https://gd2.alicdn.com/imgextra/i1/21944353/O1CN01HZwdh31i1iq2NWrYa_!!21944353.jpg_400x400.jpg";
              return InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(pic,fit: BoxFit.cover,),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(28),
                        child: Text("万代 限定 PG 1/60 红色异端高达改电镀骨架外装透明版"),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        ),
        flex: 1,
      );
    } else {
      return Expanded(
          child: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        color: Color.fromRGBO(240, 246, 246, 0.9),
        child: Text("加载中"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var leftWidth = 375 / 4;
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
      ),
      body: Row(
        children: [_leftCateWidget(leftWidth),_rightCateWidget(100, 100)],
      ),
    );
  }
}
