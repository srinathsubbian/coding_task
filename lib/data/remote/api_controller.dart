import 'package:coding_task/constant/credentials.dart';
import 'package:coding_task/constant/urls.dart';
import 'package:http/http.dart';

Future<Response> request(
    {required String url, Map<String, String>? body}) async {
  if (body != null) {
    body.putIfAbsent(queryClientId, () => Credential.clientId);
  } else {
    body = {queryClientId: Credential.clientId};
  }
  var endPoint = Uri.https(domain, url, body);
  try {
    return await get(endPoint) /*.timeout(Duration(seconds: 70))*/;
  } catch (ex) {
    throw Exception("There was a problem with the connection");
  }
}
