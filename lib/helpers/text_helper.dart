import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/http.dart' as http ;

class TextHelper {

  TextHelper._();

  static final TextHelper textHelper = TextHelper._();

  String api = "https://api.openai.com/v1/chat/completions";
  String apiKey = "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";
  List<Map<String,String>>messages=[];

  Future<String>sendMessage({required String prompt})async{
    messages.add({
      'role':"user",
      'content':prompt,
    });

    Response response = await http.post(Uri.parse(api),headers: {
      "Content-Type": "application/json",
      "Authorization":"Bearer $apiKey",
    },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": messages,
      }),
    );

    if (response.statusCode == 200) {
      String content =
      jsonDecode(response.body)['choices'][0]['message']['content'];
      content = content.trim();
      log(content);
      messages.add({
        'role': 'assistant',
        'content': content,
      });
      return content;
    }
    else{
      return 'An internal error occurred';
    }

  }

}