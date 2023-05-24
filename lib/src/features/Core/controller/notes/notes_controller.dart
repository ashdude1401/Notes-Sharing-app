import 'dart:io';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/notes/notes.dart';

class NoteController extends GetxController {
  static NoteController get instance => Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  RxList<Note> notes = RxList<Note>([]);

  @override
  void onInit() {
    super.onInit();
    // fetch the initial list of notes from the database
    fetchNotes();
  }

  void fetchNotes() async {
    try {
      var notesData =
          await firestore.collection('notes').orderBy('uploadTime').get();
      notes.value =
          notesData.docs.map((note) => Note.fromJson(note.data())).toList();
      print(notes.value);
    } catch (e) {
      // handle error
      print('Error fetching notes: $e');
    }
  }

  Future<void> addNote(Note note) async {
    try {
      // // upload pdf to Firebase Storage
      // var pdfRef = storage.ref().child('pdfs/${note.id}.pdf');
      // var pdfUploadTask = pdfRef.putFile(File(pdfPath));
      // await pdfUploadTask.whenComplete(() {});

      // // set download link of pdf in note object
      // note.downloadLink = await pdfRef.getDownloadURL();

      // add note to Firestore
      await firestore
          .collection('notes')
          .doc(note.id)
          .set(note.toJson());
    } catch (e) {
      // handle error
      print('Error adding note: $e');
    }
  }

  Future<void> deleteNote(Note note) async {
    try {
      // delete pdf from Firebase Storage
      var pdfRef = storage.ref().child('pdfs/${note.id}.pdf');
      await pdfRef.delete();

      // delete note from Firestore
      await firestore.collection('notes').doc(note.id).delete();

      // remove note from list
      notes.remove(note);
    } catch (e) {
      // handle error
      print('Error deleting note: $e');
    }
  }

  Future<void> updateNoteApproval(Note note, bool isApproved) async {
    try {
      // update isApproved field in Firestore
      await firestore
          .collection('notes')
          .doc(note.id)
          .update({'isApproved': isApproved});

      // update isApproved field in note object
      note.isApproved.value = isApproved;
    } catch (e) {
      // handle error
      print('Error updating note approval: $e');
    }
  }

  Future<void> updateNotePrice(Note note, double price) async {
    try {
      // update price field in Firestore
      await firestore.collection('notes').doc(note.id).update({'price': price});

      // update price field in note object
      note.price.value = price;
    } catch (e) {
      // handle error
      print('Error updating note price: $e');
    }
  }
}
