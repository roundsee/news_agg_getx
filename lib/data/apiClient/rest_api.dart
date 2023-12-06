import 'package:get/get.dart';

class RestAPI {
  final GetConnect connect = Get.find<GetConnect>();
  //GET request example
  Future<dynamic> getDataMethod() async {
    Response response = await connect.get('your_get_api_url');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  //post request example
  Future<dynamic> postDataMethod() async {
    //body data
    FormData formData = FormData({
      'field_name': 'field_value',
      'field_name': 'field_value',
    });
    Response response = await connect.post('your_post_api_url', formData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
