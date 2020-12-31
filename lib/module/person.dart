//产品
class PersonItem {
  String name;
  String idNum;
  String age;
  PersonItem({this.name, this.idNum, this.age});

  factory PersonItem.fromJson(dynamic json) {
    return PersonItem(
        name: json['name'], idNum: json['idNum'], age: json['age']);
  }
}

//产品列表化
class PersonList{
  List<PersonItem> data;
  PersonList({this.data});

  factory PersonList.fromJson(List json){
    return PersonList(data:
      json.map((e) => PersonItem.fromJson(e)).toList()
    );
  }
}