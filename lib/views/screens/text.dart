import 'package:chatgpt_clone/helpers/text_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController msgController = TextEditingController();
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),child: FutureBuilder(
        future: TextHelper.textHelper.sendMessage(prompt: msgController.text),
        builder: (context, snapshot) {
          return ListView.builder(itemCount:TextHelper.textHelper.messages.length,itemBuilder: (context, index) => (index%2==0)?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("User",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                  ],
                ),
                ListTile(title: Text("${TextHelper.textHelper.messages[index]['content']}"),),
              ],
            ),
          ):Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("ChatGPT",style: TextStyle(fontSize: 20,color: Colors.teal,fontWeight: FontWeight.w500),),
                  ],
                ),
                ListTile(title: Text("${TextHelper.textHelper.messages[index]['content']}"),),
              ],
            ),
          ));
        }
      ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showBottomSheet(
          context: context, builder: (context) => Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: msgController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  TextHelper.textHelper.sendMessage(prompt: msgController.text);
                  msgController.clear();
                }, icon: const Icon(Icons.send_outlined,color: Colors.teal,)),
                hintText: "Text prompt",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ),);
      },child: Icon(Icons.messenger_outline),),
    );
  }
}



