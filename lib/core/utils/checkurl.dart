import 'package:http/http.dart' as http;

Future<List<String>> filterValidImages(List<String> urls) async {
  var validUrls = <String>[];

  for (var url in urls) {
    final response = await http.head(Uri.parse(url));

    if (response.statusCode == 200) {
      validUrls.add(url);
    }
  }

  return validUrls;
}

Future<bool> isValidUrl(String url) async {
  final response = await http.head(Uri.parse(url));
  return response.statusCode == 200;
}
