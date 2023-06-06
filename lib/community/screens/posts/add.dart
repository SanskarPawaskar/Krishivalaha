import 'package:communityapp/community/services/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddState();
  }
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Write a post'),
          backgroundColor: const Color(0xff004B20),
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft,
                size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: const Color(0xff004B20),
                ),
                onPressed: () async {
                  _postService.savePost(text);
                  Navigator.pop(context);
                },
                child: const Text('post'))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xff004B20))),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Form(
                    child: TextFormField(
                  decoration: InputDecoration(hintText: 'write here'),
                  onChanged: (val) {
                    setState(() {
                      text = val;
                    });
                  },
                ))),
          ],
        ));
  }
}
