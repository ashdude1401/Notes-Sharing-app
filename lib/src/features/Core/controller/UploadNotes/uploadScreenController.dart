// import 'dart:io';
// import 'dart:typed_data';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pdfx/pdfx.dart';



// class UploadScreenController extends GetxController{

//     File? file;
//   File? thumbnailImg;
//   String? thumbnailImgName;
//   String? fileName;
//   UploadTask? task;
//   String? urlDownload;
//   PdfDocument? document;
//   String? thumbnailUrl;
  
//    final user = FirebaseAuth.instance.currentUser!;

//    static UploadTask? uploadByte(String destination, Uint8List data) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);
//       return ref.putData(data);
//     } catch (e) {
//       return null;
//     }
//   }

//   void openPDF() {
//     if (urlDownload == null) return;
//     // print("Opening url pdf ${urlDownload}");
//     // Get.to(ViewPdf(
//     //   urlDownload: urlDownload,
//     // ));
//   }

//   void uploadThumbnail(String id) async {
//     if (file == null) return;

//     // Upload the thumbnail image to Firebase Storage
//     Uint8List thumbnailBytes = await file!.readAsBytes();
//     String thumbnailDestination = 'thumbnails/$id';
//     UploadTask? thumbnailTask =
//         uploadByte(thumbnailDestination, thumbnailBytes);

//     await thumbnailTask!.whenComplete(() => null);

//     thumbnailUrl = await thumbnailTask.snapshot.ref.getDownloadURL();

//     print('Thumbnail-Link:$thumbnailUrl');
//   }

//   void uploadFile() async {
//     if (file == null) return;

//     // final fileName = p.basename(file!.path);
//     // final id = DateTime.now().microsecondsSinceEpoch.toString();
//     // final destination = 'notes/$id';

//     // task = FirebaseApi.uploadFile(destination, file!);

//     print(user.displayName);
//     //To update the ui to show progress of upload
//     // setState(() {});

//     if (task == null) return;

//     final snapshot = await task!.whenComplete(() => null);
//     urlDownload = await snapshot.ref.getDownloadURL();

//     // print('Download-Link:$formController.urlDownload');

//     uploadThumbnail(id);

//     // final newNote = Note(
//         // id: id,
//         // title: titleController.text,
//         // author: user.displayName!,
//         // uploadTime: DateTime.now(),
//         // college: collegeController.text,
//         // stream: streamController.text,
//         // tags: [],
//         // downloads: 0,
//         // views: 0,
//         // isApproved: false,
//         // downloadLink: urlDownload!,
//         // thumbnailLink: "",
//         // sellerId: user.uid,
//         // price: 0.0);

//     // final controller = Get.put(NoteController());
//     // controller.addNote(newNote);
//   }

//   void selectFile() async {
//     FilePickerResult? result = await FilePicker.platform
//         .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
//     if (result != null) {
//       final path = result.files.single.path!;
//       final pFile = result.files.first;

//       // setState(() {
//       //   file = File(path);
//       //   fileName = pFile.name;
//       //   print(file!.path);
//       // });
//       // PlatformFile fileDetails = result.files.first;
//     } else {}
//   }

//   void openFile(PlatformFile fileDetails) async {
//     // OpenFilex.open(fileDetails.path);
//   }

//   void selectImg() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpeg', 'jpg', 'png'],
//     );

//     if (result != null) {
//       final path = result.files.single.path!;
//       final pThumbnailImg = result.files.first;

//       // setState(() {
//       //   thumbnailImg = File(path);
//       //   thumbnailImgName = pThumbnailImg.name;
//       //   print(file!.path);
//       // });
//       // PlatformFile fileDetails = result.files.first;
//     } else {}
//   }

//     Widget buildUploadStatus(UploadTask? task) => StreamBuilder<TaskSnapshot>(
//         stream: task?.snapshotEvents,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final snap = snapshot.data!;
//             final progress = snap.bytesTransferred / snap.totalBytes;
//             final percentage = (progress * 100).toStringAsFixed(2);

//             return Text('$percentage%',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                 ));
//           } else {
//             return Container();
//           }
//         },
//       );


// }