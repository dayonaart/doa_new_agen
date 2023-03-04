import 'package:get/get.dart';
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormController extends GetxController {
  final MainController _mController = Get.find();
  String get ktpPath => _mController.ktpFilePath.value;
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  InputImage get inputImage => InputImage.fromFilePath(ktpPath);
  final _modelManager = EntityExtractorModelManager();
  final _entityExtractor =
      EntityExtractor(language: EntityExtractorLanguage.english);
  final _entities = <EntityAnnotation>[];
  final _language = EntityExtractorLanguage.english;
  RxList<String> imageText = RxList();
  RxString extractedText = RxString("");

  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }

  void Function() processExtractText() {
    return () async {
      await _downloadModel();
      final RecognizedText _recognizedText =
          await textRecognizer.processImage(inputImage);
      var block = _recognizedText.blocks.map((e) {
        return e.text;
      }).join(":");
      var _extracted = (await _entityExtractor.annotateText(
              "NIK:NamaTempatTgl Lahir:Jenis KelaminAlamat:RT/RW:PROVINSI JAWA TENGAHKABUPATEN WONOSOBO:Agama:ARIFA DAYONA:wONOSOBO, 08-08-1993::LAKI-LAKI:LEMPONGSARI001 005KALIWIRO:KeVDesaKecamatan : KALIWIROISLAM:Status Perkawinan: BELUM KAWIN:PekerjaanKewarganegaraan: WNIBerlaku Hingga:BELUMTIDAK BEKERJA:Gol. Darah::08-08-2018:wONOSOBO09,12-2013"))
          .map((e) => e.text)
          .join();
      _entityExtractor.close();
      textRecognizer.close();
      print(block.trim());
      extractedText.value = _extracted;
    };
  }

  Future<void> _downloadModel() async {
    var b = await _modelManager.downloadModel(_language.name);
    if (b) {
      DIALOG_HELPER("SUCCESS");
    } else {
      DIALOG_HELPER("FAILED");
    }
  }

  Future<void> _deleteModel() async {
    await _modelManager
        .deleteModel(_language.name)
        .then((value) => value ? 'success' : 'failed');
  }

  Future<void> _isModelDownloaded() async {
    await _modelManager
        .isModelDownloaded(_language.name)
        .then((value) => value ? 'downloaded' : 'not downloaded');
  }
}
