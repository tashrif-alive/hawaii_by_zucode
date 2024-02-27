import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawaii_app/src/features/admin/controls/upload_aliances/upload_aliances_model.dart';


class AliancesBannerController {
  final CollectionReference aliancesBanners =
  FirebaseFirestore.instance.collection('aliancesBanners');


  Future<void> addAliancesBanner(
      String imgUrl,
      ) async {
    try {
      String id = _generateRandomId();

      await aliancesBanners.doc(id).set(
        AliancesBanner(
          id: id,
          imgUrl: imgUrl,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding Hotel: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
