import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  List data = new List();

  _BookshelfState() {
    for (var i = 0; i < 20; i++) {
      data.add({
        'msg': {
          'image_url':
              'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1584870884&di=0bce32e1365b626918600644bf1bf582&src=http://b-ssl.duitang.com/uploads/item/201503/15/20150315154534_BRtBH.jpeg',
          'book_name': '大白(●—●)$i',
          'history': '第一章 简介'
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: this.data.length,
      itemBuilder: (context, index) {
        var _data = this.data[index];
        return ListTile(
            leading: Image.network(_data['msg']['image_url']),
            title: Text(_data['msg']['book_name']),
            subtitle: Text(_data['msg']['history']),
            trailing: Icon(Icons.reorder),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Reader()));
            });
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}

class Reader extends StatefulWidget {
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  String path;

  Database database;

  List<Map> rowlist;

  String showText;

  @override
  void initState() {
    this.showText = '暂无数据';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () async {
                  var databasepath = await getDatabasesPath();
                  path = join(databasepath, 'flutterdb.db');
                },
                child: Text('获取数据库路径'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () async {
                  var sql =
                      "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, detail TEXT)";
                  database = await openDatabase(path, version: 1,
                      onCreate: (db, version) async {
                        await db.execute(sql);
                      });
                },
                child: Text('创建表'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () async {
                  database.transaction((txn) async {
                    await txn.rawInsert(
                        "INSERT INTO user(name, age, detail) VALUES('小伟', 12, '中国')");
                  });
                },
                child: Text('插入数据'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () async {
                  rowlist = await database.rawQuery('SELECT * FROM user');
                  setState(() {
                    this.showText = rowlist[0]['name'] + rowlist[rowlist.length-1]['name'];
                    print(this.showText);
                  });
                },
                child: Text('展示数据'),
              ),
            ),
            Center(
              child: Text(this.showText)
            )
          ],
        )
    );
  }
}



//class Reader extends StatelessWidget {
//
//}
