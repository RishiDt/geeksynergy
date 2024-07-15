import 'dart:convert';
import 'package:http/http.dart' as http;

getDataFromServer() async {
  var url = Uri.parse('https://hoblist.com/api/movieList');
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({
    'category': 'movies',
    'language': 'kannada',
    'genre': 'all',
    'sort': 'voting'
  });

  var response = await http.post(url, headers: headers, body: body);
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  return jsonDecode(response.body);
}
