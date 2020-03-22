import 'package:flutter/material.dart';

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
          'book_name': '大白(●—●)',
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
          onTap:(){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Reader()));
          }
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}

class Reader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
