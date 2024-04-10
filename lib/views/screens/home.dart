import 'package:chatgpt_clone/controllers/provider_one.dart';
import 'package:chatgpt_clone/views/screens/image.dart';
import 'package:chatgpt_clone/views/screens/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2, child: Consumer<ProviderOne>(
        builder: (context,p,_) {
          return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.drag_handle),
            actions: [
              IconButton(onPressed: (){
                p.changeTheme();
              }, icon: (p.isDark)?const Icon(Icons.dark_mode):const Icon(Icons.sunny)),
            ],
            title: const Text("ChatGPT 3.5"),
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
              );
        }
      ),
    );
  }
}
