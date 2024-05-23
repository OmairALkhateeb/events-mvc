import 'package:events_mvc/const/Api.dart';
import 'package:events_mvc/model/lounges_model.dart';

class HalsService {
  Future<List<Lounges>> getallhals({category}) async {
    Map<String, dynamic> data = await Api().get(
        url:
            'http://127.0.0.1:8000/api/HallsAccordingToCategory?category=$category');
    final loungsData = data['The Halls Where their category is $category'];
    List<Lounges> halslist = [];
    for (var i = 0; i < loungsData.length; i++) {
      halslist.add(Lounges.fromJson(loungsData[i]));
      print(halslist[i].image);
    }

    return halslist;
  }
}
