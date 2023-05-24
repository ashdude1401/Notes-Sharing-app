import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:notes_sharing_app/src/features/Core/controller/UploadNotes/uploadScreenController.dart';
import 'package:notes_sharing_app/src/features/Core/controller/notes/notes_controller.dart';
import 'package:notes_sharing_app/src/features/Core/model/notes/notes.dart';
import 'package:open_filex/open_filex.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/repository/firebaseApi/firebase_api.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';


class UploadNotesScreen extends StatefulWidget {
  const UploadNotesScreen({super.key});

  @override
  State<UploadNotesScreen> createState() => _UploadNotesScreenState();
}

class _UploadNotesScreenState extends State<UploadNotesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final formController = Get.put(() => UploadScreenController());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!;

  final streamController = TextEditingController();
  final semesterController = TextEditingController();
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  final collegeController = TextEditingController();
  final tagsController = TextEditingController();

  File? file;
  File? thumbnailImg;
  String? thumbnailImgName;
  String? fileName;
  UploadTask? task;
  String? urlDownload;
  PdfDocument? document;
  String? thumbnailUrl;

  bool goNext = false;

  //For drop down

  final String _selectedStream = "IT";
  final String _selectedSemester = "4";

  final List<String> _streams = ['CSE', 'ECE', 'Mech', 'Civil', 'IT', 'BT'];
  final List<String> _semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];

  static UploadTask? uploadByte(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putData(data);
    } catch (e) {
      return null;
    }
  }



  Widget buildUploadStatus(UploadTask? task) => StreamBuilder<TaskSnapshot>(
        stream: task?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text('$percentage%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ));
          } else {
            return Container();
          }
        },
      );


    
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tTextFormHeight = size.height * 0.10;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: tAccentColor,
            ),
          ),
          title: Text(
            "Notes Upload",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.apply(color: tPrimaryColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(tDashboardPadding),
                  decoration: BoxDecoration(
                    color: tOptionalColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("Enter the Notes Detail"),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stream",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: streamController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            hintText: "Stream",
                            // suffixIcon: Icon(
                            //     color: tAccentColor,
                            //     Icons.keyboard_arrow_down_outlined),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Stream is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Semester",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: semesterController,
                          decoration: const InputDecoration(
                            hintText: "Semester",
                            suffixIcon: Icon(
                                color: tAccentColor,
                                Icons.keyboard_arrow_down_outlined),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Semester is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Notes Title",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              hintText: "Notes Title",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Semester is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Subject",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: subjectController,
                          decoration: const InputDecoration(
                              hintText: "Subject",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Subject is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "College",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: collegeController,
                          decoration: const InputDecoration(
                              hintText: "College",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "College is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tags",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: tagsController,
                          decoration: const InputDecoration(
                              hintText: "Tags",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Alleast on Tags is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      goNext
                          ? Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: selectImg,
                                      child: const Text("Add Thumbnail +"),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.picture_as_pdf_outlined),
                                    title: Text(
                                        thumbnailImgName ?? "No file selected"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: selectFile,
                                      child: const Text("Add Notes +"),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.picture_as_pdf_outlined),
                                    title: Text(fileName ?? "No file selected"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: uploadFile,
                                    child: const Text("Upload notes "),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                task != null
                                    ? buildUploadStatus(task)
                                    : Container(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: openPDF,
                                    child: const Text(" View uploaded notes "),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDashboardPadding * 1 / 2),
            child: ElevatedButton(
              onPressed: () {
                // Validate the form data
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, save the data and upload the file
                  _formKey.currentState!.save();

                  setState(() {
                    goNext = true;
                  });
                  // Your upload code goes here
                }
              },
              child: const Text("Next"),
            )),
      ),
    );
  }
  
  
  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      final path = result.files.single.path!;
      final pFile = result.files.first;

      setState(() {
        file = File(path);
        fileName = pFile.name;
        print(file!.path);
      });
      // PlatformFile fileDetails = result.files.first;
    } else {}
  }

  void openFile(PlatformFile fileDetails) async {
    OpenFilex.open(fileDetails.path);
  }

  void selectImg() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'jpg', 'png'],
    );

    if (result != null) {
      final path = result.files.single.path!;
      final pThumbnailImg = result.files.first;

      setState(() {
        thumbnailImg = File(path);
        thumbnailImgName = pThumbnailImg.name;
        print(file!.path);
      });
      // PlatformFile fileDetails = result.files.first;
    } else {}
  }
}


  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tTextFormHeight = size.height * 0.10;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: tAccentColor,
            ),
          ),
          title: Text(
            "Notes Upload",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.apply(color: tPrimaryColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(tDashboardPadding),
                  decoration: BoxDecoration(
                    color: tOptionalColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("Enter the Notes Detail"),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stream",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: streamController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            hintText: "Stream",
                            // suffixIcon: Icon(
                            //     color: tAccentColor,
                            //     Icons.keyboard_arrow_down_outlined),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Stream is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Semester",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: semesterController,
                          decoration: const InputDecoration(
                            hintText: "Semester",
                            suffixIcon: Icon(
                                color: tAccentColor,
                                Icons.keyboard_arrow_down_outlined),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Semester is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Notes Title",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              hintText: "Notes Title",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Semester is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Subject",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: subjectController,
                          decoration: const InputDecoration(
                              hintText: "Subject",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Subject is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "College",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: collegeController,
                          decoration: const InputDecoration(
                              hintText: "College",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "College is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tags",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(fontSizeDelta: -4, color: tPrimaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: tTextFormHeight,
                        child: TextFormField(
                          controller: tagsController,
                          decoration: const InputDecoration(
                              hintText: "Tags",
                              suffixIcon: Icon(
                                  color: tAccentColor,
                                  Icons.keyboard_arrow_down_outlined)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Alleast on Tags is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      goNext
                          ? Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: selectImg,
                                      child: const Text("Add Thumbnail +"),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.picture_as_pdf_outlined),
                                    title: Text(
                                        thumbnailImgName ?? "No file selected"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: selectFile,
                                      child: const Text("Add Notes +"),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.picture_as_pdf_outlined),
                                    title: Text(fileName ?? "No file selected"),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: uploadFile,
                                    child: const Text("Upload notes "),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                task != null
                                    ? buildUploadStatus(task)
                                    : Container(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: openPDF,
                                    child: const Text(" View uploaded notes "),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDashboardPadding * 1 / 2),
            child: ElevatedButton(
              onPressed: () {
                // Validate the form data
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, save the data and upload the file
                  _formKey.currentState!.save();

                  setState(() {
                    goNext = true;
                  });
                  // Your upload code goes here
                }
              },
              child: const Text("Next"),
            )),
      ),
    );
  }
  
  
  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      final path = result.files.single.path!;
      final pFile = result.files.first;

      setState(() {
        file = File(path);
        fileName = pFile.name;
        print(file!.path);
      });
      // PlatformFile fileDetails = result.files.first;
    } else {}
  }

  void openFile(PlatformFile fileDetails) async {
    OpenFilex.open(fileDetails.path);
  }

  void selectImg() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'jpg', 'png'],
    );

    if (result != null) {
      final path = result.files.single.path!;
      final pThumbnailImg = result.files.first;

      setState(() {
        thumbnailImg = File(path);
        thumbnailImgName = pThumbnailImg.name;
        print(file!.path);
      });
      // PlatformFile fileDetails = result.files.first;
    } else {}
  }
}

