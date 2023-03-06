// import 'package:flutter/services.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:mobilenew/widget/dashed_rect.dart';
// import 'package:mobilenew/widget/text_recognize_painter.dart';
// final TextRecognizer _textRecognizer = TextRecognizer();
// CustomPaint? customPaint;
// double maxWidth = 0;
// double maxHeight = 0;
// final bool _canProcess = true;
// bool _isBusy = false;
// bool converting = false;

// Future _processCameraImage(CameraImage image) async {
//   if (!_canProcess) return;
//   if (_isBusy) return;
//   _isBusy = true;
//   final WriteBuffer allBytes = WriteBuffer();
//   for (final Plane plane in image.planes) {
//     allBytes.putUint8List(plane.bytes);
//   }
//   final bytes = allBytes.done().buffer.asUint8List();

//   final Size imageSize =
//       Size(image.width.toDouble(), image.height.toDouble());

//   final camera = _cameras[0];
//   final imageRotation =
//       InputImageRotationValue.fromRawValue(camera.sensorOrientation);
//   if (imageRotation == null) return;

//   final inputImageFormat =
//       InputImageFormatValue.fromRawValue(image.format.raw);
//   if (inputImageFormat == null) return;

//   final planeData = image.planes.map(
//     (Plane plane) {
//       return InputImagePlaneMetadata(
//         bytesPerRow: plane.bytesPerRow,
//         height: plane.height,
//         width: plane.width,
//       );
//     },
//   ).toList();

//   final inputImageData = InputImageData(
//     size: imageSize,
//     imageRotation: imageRotation,
//     inputImageFormat: inputImageFormat,
//     planeData: planeData,
//   );

//   final inputImage =
//       InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

//   final _recognizedText = await _textRecognizer.processImage(inputImage);
//   if (inputImage.inputImageData?.size != null &&
//       inputImage.inputImageData?.imageRotation != null &&
//       _cameraPrev.currentContext != null) {
//     final RenderBox renderBox =
//         _cameraPrev.currentContext?.findRenderObject() as RenderBox;

//     var painter = TextRecognizerPainter(
//       _recognizedText,
//       inputImage.inputImageData!.size,
//       inputImage.inputImageData!.imageRotation,
//       renderBox,
//       (val) async {
//         scannedText = val;
//         if (checkKtpData()) {
//           await camController?.stopImageStream();
//           await Future.delayed(const Duration(seconds: 3));
//           takePicture().call();
//         }
//       },
//       getRawData: (val) async {},
//       boxBottomOff: 9,
//       boxTopOff: 9,
//       boxRightOff: 9,
//       boxLeftOff: 9,
//     );

//     customPaint = CustomPaint(painter: painter);
//     await Future.delayed(const Duration(milliseconds: 900)).then((value) {
//       if (!converting) {
//         _isBusy = false;
//       }
//       update();
//     });
//   }
// }

// Widget cameraPreviewWidget({
//   double? boxHeight,
//   double? boxWidth,
// }) {
//   const double previewAspectRatio = 0.5;
//   return SizedBox(
//     height: boxHeight ?? Get.height,
//     // width: boxWidth ?? Get.width,
//     child: Stack(
//       alignment: Alignment.topCenter,
//       clipBehavior: Clip.none,
//       fit: StackFit.expand,
//       children: <Widget>[
//         Center(
//           child: SizedBox(
//             height: boxHeight ?? Get.height / 5,
//             key: _cameraPrev,
//             child: AspectRatio(
//               aspectRatio: 1 / previewAspectRatio,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//                 child: Transform.scale(
//                   scale:
//                       camController!.value.aspectRatio / previewAspectRatio,
//                   child: Center(
//                     child: CameraPreview(
//                       camController!,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (customPaint != null)
//           LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//             maxWidth = constraints.maxWidth;
//             maxHeight = constraints.maxHeight;
//             return GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onTapDown: (TapDownDetails details) =>
//                   onViewFinderTap(details, constraints),
//               child: customPaint!,
//             );
//           }),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: boxHeight ?? Get.height / 5,
//             child: const DashedRect(color: Colors.white),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
//   if (camController == null) {
//     return;
//   }

//   final Offset offset = Offset(
//     details.localPosition.dx / constraints.maxWidth,
//     details.localPosition.dy / constraints.maxHeight,
//   );
//   camController?.setExposurePoint(offset);
//   camController?.setFocusPoint(offset);
// }

// String? _parseDate(String date) {
//   try {
//     var _formatted = DateFormat.yMd().parse(date);
//     return DateFormat("dd MMMM yyyy").format(_formatted);
//   } catch (e) {
//     return null;
//   }
// }

// String? _fullName(String? firstName, String? lastName) {
//   try {
//     return "${firstName!} ${lastName!}";
//   } catch (e) {
//     return null;
//   }
// }

// bool checkKtpData() {
//   var _sc = scannedText.replaceAll(":", "").split(" ");
//   var _findNik = _sc.indexOf("NIK");
//   bool _nikValidation = _sc[(_findNik - 1)].length == 16;
//   var _name =
//       _fullName(_sc[(_sc.indexOf("NIK")) + 1], _sc[(_sc.indexOf("NIK")) + 2]);
//   var _dobValidation = _parseDate(_sc
//       .where((element) => element.contains("-"))
//       .first
//       .replaceAll("-", "/")
//       .trim());
//   if (_nikValidation) {
//     var _findNikIndex = (_sc.indexOf("NIK") - 1);
//     ktpData[0] = _sc[_findNikIndex];
//     validation[0] = true;
//   }
//   if (_name != null) {
//     ktpData[1] = _name;
//     validation[1] = true;
//   }
//   if (_dobValidation != null) {
//     ktpData[2] = _dobValidation;
//     validation[2] = true;
//   }
//   return validation.every((element) => element);
// }

// List<bool> validation = List.generate(3, (i) => false);
// List<String> ktpData = List.generate(3, (i) => "");
// String dob = "";
// double get progressTextRecognize {
//   var _check = validation.where((e) => e).length;
//   switch (_check) {
//     case 1:
//       return 35;
//     case 2:
//       return 75;
//     case 3:
//       return 100;
//     default:
//       return 0;
//   }
// }
