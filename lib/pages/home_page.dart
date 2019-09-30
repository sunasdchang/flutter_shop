import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';


class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '还没有请求数据';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('请求远程数据'),),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // TextField(
                //   controller: typeController,
                //   decoration: InputDecoration(
                //       contentPadding: EdgeInsets.all(10.0),
                //       labelText: '美女类型',
                //       helperText: '请输入你喜欢的类型'),
                //   autofocus: false,
                // ),
                RaisedButton(
                  onPressed: _juejin,
                  child: Text('请求数据'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )),
    );
  }

  void _juejin() {
    print('开始向极客时间请求数据............');
    // if (typeController.text.toString() == '') {
    //   showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(title: Text('美女类型不能为空')));
    // } else {
    //   getHttp(typeController.text.toString()).then((val) {
    //     setState(() {
    //       showText = val['data']['name'].toString();
    //     });
    //   });
    // }
    getHttp().then((val){
      setState(() {
        showText=val['data'].toString();
      });

    });
  }
Future getHttp()async{
    try{
      Response response;
      Dio dio = new Dio();
      dio.options.headers= httpHeaders;
      response =await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
      print(response);
      return response.data;
    }catch(e){
      return print(e);
    }
  }

}
