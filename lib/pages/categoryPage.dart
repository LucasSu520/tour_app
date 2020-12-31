import 'package:flutter/material.dart';
import 'package:tour_app/module/person.dart';
import 'package:tour_app/server/persons.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  PersonList pList;

  @override
  void initState() {
    pList = new PersonList(data: []);
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
            : ListView.builder(
                itemBuilder: (context, index) {
                  if (index + 2 == pList.data.length) {
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
              ));
  }

  getPersonList() async {
    var json = await getPerson();
    PersonList newList = PersonList.fromJson(json);
    setState(() {
      pList.data.addAll(newList.data);
    });
  }
}
