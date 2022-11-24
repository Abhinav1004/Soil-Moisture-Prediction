import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:soil_moisture/features/examine/domain/repository/feedback_repository.dart';
import 'package:http/http.dart' as http;

class FeedbackRepositoryImp extends FeedbackRepository{
  @override
  Future<void> sendFeedback(bool wasHelpful, String label, File image) async {
    Uint8List imagebytes = await image.readAsBytes(); //convert to bytes
    String base64string = base64.encode(imagebytes);
    var res = await http.post(
      Uri.parse("https://uia.vercel.app/api/addFeedback"),
      body: {
        "image":base64string,
        "result": label,
        "action": wasHelpful.toString()
      }
    );
    print(res.body);
  }

}