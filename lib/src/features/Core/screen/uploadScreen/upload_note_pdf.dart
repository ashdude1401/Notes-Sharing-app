// import 'dart:io';
// import 'dart:typed_data';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path/path.dart' as p;
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:pdfx/pdfx.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import '../../../../constants/sizes.dart';
// import '../../../../repository/firebaseApi/firebase_api.dart';
// import '../../controller/UploadNotes/uploadScreenController.dart';
// import '../../controller/notes/notes_controller.dart';
// import '../../model/notes/notes.dart';

// class UploadNotesPDF extends StatefulWidget {
//   const UploadNotesPDF({super.key});

//   @override
//   State<UploadNotesPDF> createState() => _UploadNotesPDFState();
// }

// class _UploadNotesPDFState extends State<UploadNotesPDF> {
//   final formController = Get.put(() => UploadScreenController());

//   File? file;
//   File? thumbnailImg;
//   String? thumbnailImgName;
//   String? fileName;
//   UploadTask? task;
//   String? urlDownload;
//   PdfDocument? document;
//   String? thumbnailUrl;

//    final user = FirebaseAuth.instance.currentUser!;

//   static UploadTask? uploadByte(String destination, Uint8List data) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);
//       return ref.putData(data);
//     } catch (e) {
//       return null;
//     }
//   }

//   void openPDF() {
//     if (urlDownload == null) return;
//     print("Opening url pdf ${urlDownload}");
//     Get.to(ViewPdf(
//       urlDownload: urlDownload,
//     ));
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

//     final fileName = p.basename(file!.path);
//     final id = DateTime.now().microsecondsSinceEpoch.toString();
//     final destination = 'notes/$id';

//     task = FirebaseApi.uploadFile(destination, file!);

//     print(user.displayName);
//     //To update the ui to show progress of upload
//     setState(() {});

//     if (task == null) return;

//     final snapshot = await task!.whenComplete(() => null);
//     urlDownload = await snapshot.ref.getDownloadURL();

//     print('Download-Link:$formController.urlDownload');

//     uploadThumbnail(id);

//     final newNote = Note(
//         id: id,
//         title: titleController.text,
//         author: user.displayName!,
//         uploadTime: DateTime.now(),
//         college: collegeController.text,
//         stream: streamController.text,
//         tags: [],
//         downloads: 0,
//         views: 0,
//         isApproved: false,
//         downloadLink: urlDownload!,
//         thumbnailLink: "",
//         sellerId: user.uid,
//         price: 0.0);

//     final controller = Get.put(NoteController());
//     controller.addNote(newNote);
//   }

//   void selectFile() async {
//     FilePickerResult? result = await FilePicker.platform
//         .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
//     if (result != null) {
//       final path = result.files.single.path!;
//       final pFile = result.files.first;

//       setState(() {
//         file = File(path);
//         fileName = pFile.name;
//         print(file!.path);
//       });
//       // PlatformFile fileDetails = result.files.first;
//     } else {}
//   }

//   void openFile(PlatformFile fileDetails) async {
//     OpenFilex.open(fileDetails.path);
//   }

//   void selectImg() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpeg', 'jpg', 'png'],
//     );

//     if (result != null) {
//       final path = result.files.single.path!;
//       final pThumbnailImg = result.files.first;

//       setState(() {
//         thumbnailImg = File(path);
//         thumbnailImgName = pThumbnailImg.name;
//         print(file!.path);
//       });
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

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: selectImg,
//                 child: const Text("Add Thumbnail +"),
//               )),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.01,
//           ),
//           SizedBox(
//             height: size.height * 0.06,
//             child: ListTile(
//               leading: const Icon(Icons.picture_as_pdf_outlined),
//               title: Text(thumbnailImgName ?? "No file selected"),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.03,
//           ),
//           SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: selectFile,
//                 child: const Text("Add Notes +"),
//               )),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.01,
//           ),
//           SizedBox(
//             height: size.height * 0.06,
//             child: ListTile(
//               leading: const Icon(Icons.picture_as_pdf_outlined),
//               title: Text(fileName ?? "No file selected"),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.01,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: uploadFile,
//               child: const Text("Upload notes "),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.01,
//           ),
//           task != null ? buildUploadStatus(task) : Container(),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.01,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: openPDF,
//               child: const Text(" View uploaded notes "),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ViewPdf extends StatelessWidget {
//   const ViewPdf({
//     super.key,
//     required this.urlDownload,
//   });

//   final String? urlDownload;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "View Uploded Notes",
//             style: Theme.of(context)
//                 .textTheme
//                 .titleSmall
//                 ?.apply(color: Colors.white),
//           ),
//         ),
//         body: Container(
//           margin: const EdgeInsets.all(tDashboardPadding * 0.5),
//           decoration: BoxDecoration(
//               border: Border.all(
//                   color: const Color(0xFF000000).withOpacity(0.4), width: 2),
//               borderRadius: BorderRadius.circular(9)),
//           padding: const EdgeInsets.all(tDashboardPadding * 1 / 2),
//           child: urlDownload == null
//               ? const Text("Error in loading ")
//               : SfPdfViewer.network(
//                   urlDownload!,
//                   pageLayoutMode: PdfPageLayoutMode.continuous,
//                   interactionMode: PdfInteractionMode.pan,
//                   pageSpacing: 10,
//                 ),
//         ),
//       ),
//     );
//   }
// }
