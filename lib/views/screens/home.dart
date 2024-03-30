import 'package:chatgpt_clone/views/screens/image.dart';
import 'package:chatgpt_clone/views/screens/text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, child: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.drag_handle),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_sharp))
        ],
        title: Text("ChatGPT 3.5"),
        bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message_outlined),child: Text("Text Gen"),),
              Tab(icon: Icon(Icons.image_outlined),child: Text("Image Gen"),),
            ]),
      ),
      body: const TabBarView(children: [
        TextPage(),
        ImagePage(),
      ]),
    ),
    );
  }
}
