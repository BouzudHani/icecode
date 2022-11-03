import 'dart:convert';
import 'dart:io';

import 'package:games/utilities/constante.dart';
import 'package:games/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class TwilioRepo{

  static var headers = {
    'Authorization': AppConstant.TOKEN,
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static Future<bool> sendMessage(String phone,String message) async {
      //var url = Uri.https('https://api.twilio.com', '/2010-04-01/Accounts/${AppConstant.AcountSID}/Messages.json');
      //var request = http.Request('POST', Uri.parse('https://api.twilio.com/2010-04-01/Accounts/${AppConstant.AcountSID}/Messages.json'));
     // print(url.path);
      var body = {
        'To': 'whatsapp:$phone',
        'Body': message,
        'From': 'whatsapp:${AppConstant.PhoneNumber}'
      };
      print(body);
      print(headers);
      try{
        http.Response response = await http.post(Uri.parse('https://api.twilio.com/2010-04-01/Accounts/${AppConstant.AcountSID}/Messages.json'),headers: headers , body: body);
        print(response.body);
        print(response.statusCode);
        if(response.statusCode == 200 || response.statusCode == 201){
          toastMe('Invitation sent Successfully');
          return true;
        }else{
          toastMe('Your twilio is expired');
          return false;
        }
      }on SocketException{
        toastMe('Internet Connection Issue');
        return false;
      }catch(e) {
        print(e);
        print('Exception');
        return false;
      }


  }

  static Future<void> send() async  {
    String creds = '${AppConstant.AcountSID}:${AppConstant.Token}';
    var bytes = utf8.encode(creds);
    var base64Str = base64.encode(bytes);
    print(base64Str);
    var headers = {
      'Authorization': 'Basic $base64Str',
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api.twilio.com/2010-04-01/Accounts/ACddbad304cd0fa918f8059bc8713ac40e/Messages.json'));
    request.bodyFields = {
      'To': 'whatsapp:+971522545494',
      'Body': 'Your appointment ',
      'From': 'whatsapp:+14155238886'
    };
    request.headers.addAll(headers);
    print('sending');
    http.StreamedResponse response = await request.send();
    print('sended');
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }


}