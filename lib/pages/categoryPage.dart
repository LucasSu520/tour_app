import 'package:flutter/material.dart';
import 'package:tour_app/module/person.dart';
import 'package:tour_app/server/persons.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  PersonList pList;
  ScrollController _scrollController;


  @override
  void initState() {
    pList = new PersonList(data: []);
    _scrollController = new ScrollController();

    //this purpose of the method is to add the data to the list when the list is long
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent && pList.data.length>20 ) {
        getPersonList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('分类'),
        ),
        body: pList.data.length == 0
            ? RaisedButton(
                child: Text('点击获取图文列表'),
                onPressed: () {
                  getPersonList();
                },
                // ignore: missing_return
              )
            : RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView.builder(
                  controller: this._scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    //if the number of data is small, this method will add data to the list, when the list is short
                    if(index+2==pList.data.length&&pList.data.length<20){
                      getPersonList();
                    }
                    return Card(
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("姓名：" + pList.data[index].name),
                              Text("学号：" + pList.data[index].idNum),
                              Text("年龄：" + pList.data[index].age)
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: pList.data.length,
                ),
              ));
  }

  getPersonList() async {
    var json = await getPerson();
    PersonList newList = PersonList.fromJson(json);
    setState(() {
      pList.data.addAll(newList.data);
    });
  }

  //achieve the feature when  pull down to refresh the list
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      this.pList.data = this.pList.data.reversed.toList();
    });
    return null;
  }
}
