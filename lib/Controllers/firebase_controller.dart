import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  @override
  void onInit() {
    _connectToFirebase();
    super.onInit();
  }

  _connectToFirebase() async {
    await Firebase.initializeApp();
  }
}
