import 'package:flutter/material.dart';
import '../view/book_view.dart';


class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '书架',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.red,
      ),
//      body: Center(
//        child: Text('书架'),
//      ),
      body: new Bookshelf()
    );
  }
}
