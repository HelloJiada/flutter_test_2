import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void getHttp() async {
  Dio dio = Dio();
  Response response;
  response = await dio.get("");
  print(response.data.toString());
  //get 请求两个写法一样
  response = await dio.get("test",queryParameters: {"id":12,"name":"wendu"});
  print(response.data.toString());
//post请求
  response = await dio.post("",data: {"id":"","name":"ni"});
  //发起多个并发请求
  response = (await Future.wait([dio.post(""),dio.get("")])) as Response;
//下载文件
response = await dio.download("", "");
//以流的方式接手响应数据
Response<ResponseBody> rs = await Dio().get<ResponseBody>("",
options: Options(responseType:  ResponseType.stream),//设置接受类型
);
print(rs.data.stream);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("首页"),
        ),
        body: ListView(
          children: <Widget>[
            HomePage(),
            _titleWideget("热门推荐"),
            _recproductListWidget(),
            _titleWideget("猜你喜欢"),
            _hotProdctListWidget(),
          ],
        )
        );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> imageList = [
    {
      "url":
          "https://ts1.cn.mm.bing.net/th/id/R-C.8061640ca22f7dbb7791de58c3056ad1?rik=zVbaQfBRyokI7w&riu=http%3a%2f%2ff.hiphotos.baidu.com%2fzhidao%2fpic%2fitem%2f9825bc315c6034a80323b3d9ca134954082376a0.jpg&ehk=c%2fY%2bImM4cYT8bTwF6ummaUm2HpEGJko0m6vcJ1yFwXg%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "url":
          "https://img.zcool.cn/community/0181115a50f66da8012180c50fd125.jpg@2o.jpg"
    },
    {
      "url":
          "https://ts1.cn.mm.bing.net/th/id/R-C.ed7c65b8c184047699049a62a38bd9be?rik=7dQbA3M9tXsKVw&riu=http%3a%2f%2fpic.paopaoche.net%2fup%2f2017-5%2f2017052609385028986.jpg&ehk=rVMwKBgmHIqT043d%2bHIuHOZ34MVnaMjV8JBgTaLw8jo%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "url":
          "https://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/3b292df5e0fe99254410fd2b34a85edf8db171a9.jpg"
    },
    {
      "url":
          "https://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/8b13632762d0f70301a3374e0efa513d2697c50b.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
          itemCount: imageList.length, //数量
          itemBuilder: (context, index) {
            return Image(
              image: NetworkImage(imageList[index]["url"]),
              fit: BoxFit.cover,
            );
          },
          pagination: const SwiperPagination(), //底部分页
          // control: new SwiperControl(),//左右箭头
          loop: true, //无限循环
          autoplay: true, //自动轮播
        ),
      ),
    );
  }
}

Widget _titleWideget(value) {
  return Container(
    height: 20,
    margin: EdgeInsets.only(left: 20),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
      color: Colors.blue,
      width: 10,
    ))),
    child: Text(
      value,
      style: TextStyle(color: Colors.black87, fontSize: 17),
    ),
  );
}

Widget _hotProdctListWidget() {
  return Container(
    height: 234,
    padding: EdgeInsets.all(20),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        String sPic =
            "https://gd4.alicdn.com/imgextra/i4/3827370406/O1CN01RpdGN01ErzTOd3mWR_!!3827370406.jpg_400x400.jpg";
        return Column(
          children: <Widget>[
            Container(
              height: 140,
              width: 140,
              margin: EdgeInsets.only(right: 21),
              child: Image.network(
                sPic,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 44,
              child: Text(
                "¥219.00-262.00",
                style: TextStyle(color: Colors.black87),
              ),
            )
          ],
        );
      },
      itemCount: 10,
    ),
  );
}

Widget _recproductListWidget() {
  List<String> _bestProductList = [
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
  ];

  var itemWidth = (ScreenUtil().screenWidth - 30) / 2.0;
  return Container(
    padding: EdgeInsets.all(10),
    child: Wrap(
      runSpacing: 10,
      spacing: 10,
      children: _bestProductList.map((e) {
        return Container(
          padding: EdgeInsets.all(10),
          width: itemWidth,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    "https://gd4.alicdn.com/imgextra/i3/3827370406/O1CN017HROGN1ErzRNyqCZa_!!3827370406.jpg_400x400.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "现货 万代 MG 1/100 能天使高达普通版Gundam Exia拼装模型GN-001",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "¥219.00",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "顺风到付",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
