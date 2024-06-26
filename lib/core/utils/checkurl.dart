import 'package:http/http.dart' as http;
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/sharedprefs.dart';

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
  print(url);
  try {
    final response = await http.head(Uri.parse(url));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
  //final response = await http.head(Uri.parse(url));
  //return response.statusCode == 200;
}

Map<String, String> getHeaders(String reqType) {
  //var pref = new PrefUtils();
  //var token = pref.getUserToken();
  //var lang = pref.getLanguage();
  //var fcm = pref.getfcmToken();
  var theHeader;

  switch (reqType) {
    case "req":
      theHeader = {
        'Content-Type': 'application/json',
        'Authorization': SharedPrefs().token,
        'Accept-Language': SharedPrefs().language
      };

      break;
    case "defaulttoken":
      theHeader = {
        'Content-Type': 'application/json',
        'Authorization':
            '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d',
        'Accept-Language': SharedPrefs().language,
        'fcm': SharedPrefs().fcm,
        'User-Agent': SharedPrefs().useragent
      };

      break;

    case "register":
      theHeader = {
        'Content-Type': 'application/json',
        'Authorization':
            '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d',
        'User-Agent': SharedPrefs().useragent
      };
      break;
    case "login":
      theHeader = {
        'Content-Type': 'application/json',
        'Authorization':
            '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d',
        'User-Agent': SharedPrefs().useragent
      };
      break;

    default:
  }

  return theHeader;
}
