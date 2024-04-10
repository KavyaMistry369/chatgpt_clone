import 'package:chatgpt_clone/helpers/image_helper.dart';
import 'package:flutter/material.dart';

import '../../helpers/text_helper.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController msgController = TextEditingController();
    return Scaffold(
      body:  Padding(padding: EdgeInsets.all(16),child: FutureBuilder(
        future: ImageHelper.imageHelper.getImages(prompt: msgController.text),
        builder: (context, snapshot)  {
          if(snapshot.hasData){
            return ListView.builder(itemCount:ImageHelper.imageHelper.messages.length,itemBuilder: (context, index) => (index%2==0)?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("User",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  ListTile(title: Text("${ImageHelper.imageHelper.messages[index]['content']}",style: TextStyle(fontSize: 20),),),
                ],
              ),
            ):Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Dall-e-2",style: TextStyle(fontSize: 20,color: Colors.teal,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Image.network("${ImageHelper.imageHelper.messages[index]['content']}",),
                ],
              ),
            ));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
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
                  ImageHelper.imageHelper.getImages(prompt: msgController.text);
                  msgController.clear();
                }, icon: const Icon(Icons.send_outlined,color: Colors.teal,)),
                hintText: "Image prompt",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ),);
      },child: Icon(Icons.image_search),),
    );
  }
}
