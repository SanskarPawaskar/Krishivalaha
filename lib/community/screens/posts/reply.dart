import 'package:communityapp/community/models/post.dart';
import 'package:communityapp/community/screens/posts/list.dart';
import 'package:communityapp/community/services/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Replies extends StatefulWidget {
  const Replies({Key? key}) : super(key: key);

  @override
  _RepliesState createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  final PostService _postService = PostService();
  String text = '';
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as PostModel;
    return FutureProvider.value(
        value: _postService.getReplies(args),
        initialData: null,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: ListPosts(null)),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Form(
                        child: TextFormField(
                      controller: _textController,
                      onChanged: (val) {
                        setState(() {
                          text = val;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your text here', // Add hint text
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green, // Set the border color
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Color(0xff004B20),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Back',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Color(0xff004B20),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextButton(
                            onPressed: () async {
                              await _postService.reply(args, text);
                              _textController.text = '';
                              setState(() {
                                text = '';
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Reply",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
