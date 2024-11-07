import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class HomeService with ListenableServiceMixin {
  XFile? _photoClient;
  XFile? get photoClient => _photoClient;

  void selectPhoto() async {
    _photoClient = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxWidth: 1024,
        maxHeight: 768);
    notifyListeners();
  }
}
