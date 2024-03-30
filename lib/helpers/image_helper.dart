import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ImageHelper {

  ImageHelper._();

  static final ImageHelper imageHelper = ImageHelper._();

  String api = "https://api.openai.com/v1/images/generations";
  String apiKey="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";
  List<Map<String,String>>messages=[];

  Future<String>getImages({required String prompt})async {

    messages.add({
      'role': 'assistant',
      'content': prompt,
    });

Response response = await http.post(Uri.parse(api),headers: {
  "Content-Type": "application/json",
  "Authorization":"Bearer $apiKey",
},
  body: jsonEncode({
    "model":"dall-e-2",
    "prompt":prompt,
    "size":"1024x1024",
    "quality":"standard"
  },),
);

if (response.statusCode == 200) {
  String content =
  jsonDecode(response.body)['data'][0]['url'];
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