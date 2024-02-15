import 'dart:convert';
import 'package:new_agg/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/story/my_story_model.dart';
import 'package:new_agg/story/story_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MediaType { image, video, text }

class WhatsappStory {
  final MediaType? mediaType;
  final String? media;
  final double? duration;
  final String? caption;
  final String? when;
  final String? color;

  WhatsappStory({
    this.mediaType,
    this.media,
    this.duration,
    this.caption,
    this.when,
    this.color,
  });
}

class Highlight {
  final String? image;
  final String? headline;

  Highlight({this.image, this.headline});
}

class Gnews {
  final String? title;
  final List<Highlight>? highlights;

  Gnews({this.title, this.highlights});
}

/// The repository fetches the data from the same directory from git.
/// This is just to demonstrate fetching from a remote (workflow).
class Repository {
  static MediaType _translateType(String? type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  static Future<List<WhatsappStory>> getWhatsappStories() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

    var headers = getHeaders("req");
    List<WhatsappStory> listStory = (List<WhatsappStory>.of([]));
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.contentEndpoints.StoryContent);
    //_SimpleUri (https://a1c1-103-124-115-148.ngrok-free.app/api/contents/single/bad3762c-9d48-4ecc-aad4-310b26d7b219)

    http.Response resp = await http.get(url, headers: headers);
    if (resp.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    MediaType mt = _translateType("image");
    if (resp.statusCode == 404) {}
    if (resp.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      myStoryModel myStory = myStoryModel.fromJson(jsonDecode(resp.body));
      // DataStory singleStory;
     
      for (int i = 0; i < myStory.data!.content!.length; i++) {
        WhatsappStory singleStory = new WhatsappStory(
            caption: myStory.data!.content![i].description,
            mediaType: mt,
            duration: 3,
            when: "2024-02-12",
            media: myStory.data!.content![i].header);
        //singleStory.caption = myStory.data!.content![i].title;
        //singleStory.mediaType = "image";
        //imageUrl = myStory.data!.content![i].header!;
        /*
        if (!Uri.tryParse(imageUrl)!.hasAbsolutePath) {
          singleStory.media =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        } else {
          if (await isValidUrl(imageUrl)) {
            singleStory.media = imageUrl;
          } else {
            singleStory.media =
                "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
          }
        }
      */
        listStory.add(singleStory);
      }
      print(listStory);
    }

//static Future<List<WhatsappStory>> getWhatsappStories() async {
    // final uri =
    //     "https://raw.githubusercontent.com/blackmann/storyexample/master/lib/data/whatsapp.json";
    // final response = await get(Uri.parse(uri));

    //final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
    final data = jsonDecode(utf8.decode(resp.bodyBytes))['data']['content'];

    final res = data.map<WhatsappStory>((it) {
      return WhatsappStory(
          caption: it['description'], //it['caption'],
          media: it['header'], //it['media'],
          duration: double.parse("3"), //double.parse(it['duration']),
          when: '2024-01-01', //it['when'],
          mediaType: _translateType("image"), //_translateType(it['mediaType']),
          color: ""); //it['color']);
    }).toList();

    return res;
  }

  // {
  //   "mediaType": "image",
  //   "media": "https://talksport.com/wp-content/uploads/sites/5/2019/11/NINTCHDBPICT000537053493-e1572968665876.jpg?strip=all&w=960&quality=100",
  //   "duration": "5.0",
  //   "caption": "What do you think about this guy? He doing music, boxing, youtube. Like tf, how?",
  //   "when": "14 hours ago",
  //   "color": ""
  // },
  /*
    final uri =
        "https://raw.githubusercontent.com/blackmann/storyexample/master/lib/data/whatsapp.json";
    final response = await get(Uri.parse(uri));
    final xjson = jsonEncode(response); //listStory);
    final datajson = jsonDecode(xjson);

    final res = datajson.map<WhatsappStory>((it) {
      return WhatsappStory(
          caption: it['caption'],
          media: it['media'],
          duration: double.parse(it['duration']),
          when: it['when'],
          mediaType: _translateType(it['mediaType']),
          color: it['color']);
    }).toList();

    return res;
  }
*/

  static Future<Gnews> getNews() async {
    final uri =
        "https://raw.githubusercontent.com/blackmann/storyexample/master/lib/data/gnews.json";
    final response = await get(Uri.parse(uri));

    // use utf8.decode to make emojis work
    final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];

    final title = data['title'];
    final highlights = data['highlights'].map<Highlight>((it) {
      return Highlight(headline: it['headline'], image: it['image']);
    }).toList();

    return Gnews(title: title, highlights: highlights);
  }
}
