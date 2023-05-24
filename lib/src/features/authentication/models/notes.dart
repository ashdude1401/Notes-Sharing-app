class Notes {
  String caption;
  String authorId;
  double price;
  double discount;
  String college;
  String subject;
  String stream;
  List<String> tags;
  String fileUrl;
  List<String> downloads;
  List<String> impressions;
  List<Map<String, dynamic>> ratings;
  List<Map<String, dynamic>> reviews;

  Notes({
    required this.caption,
    required this.authorId,
    required this.price,
    required this.discount,
    required this.college,
    required this.subject,
    required this.stream,
    required this.tags,
    required this.fileUrl,
    required this.downloads,
    required this.impressions,
    required this.ratings,
    required this.reviews,
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      caption: json['caption'],
      authorId: json['author']['Id'],
      price: json['price'],
      discount: json['discount'],
      college: json['college'],
      subject: json['subject'],
      stream: json['stream'],
      tags: List<String>.from(json['tags']),
      fileUrl: json['file_url'],
      downloads: List<String>.from(json['downloads']),
      impressions: List<String>.from(json['impressions']),
      ratings: List<Map<String, dynamic>>.from(json['ratings']),
      reviews: List<Map<String, dynamic>>.from(json['reviews']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caption'] = caption;
    data['author'] = {'Id': authorId};
    data['price'] = price;
    data['discount'] = discount;
    data['college'] = college;
    data['subject'] = subject;
    data['stream'] = stream;
    data['tags'] = tags;
    data['file_url'] = fileUrl;
    data['downloads'] = downloads;
    data['impressions'] = impressions;
    data['ratings'] = ratings;
    data['reviews'] = reviews;
    return data;
  }

  bool isComplete() {
    return caption.isNotEmpty &&
        authorId.isNotEmpty &&
        college.isNotEmpty &&
        subject.isNotEmpty &&
        tags.isNotEmpty &&
        fileUrl.isNotEmpty &&
        downloads.isNotEmpty &&
        impressions.isNotEmpty &&
        ratings.isNotEmpty &&
        reviews.isNotEmpty &&
        stream.isNotEmpty;
  }
  
  bool isHot() {
    return downloads.length >= 100 || impressions.length >= 500;
  }
  
  Map<String, dynamic> toSearchMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorId'] = authorId;
    data['college'] = college;
    data['stream'] = stream;
    return data;
  }
  
  static List<Notes> filterNotesByAuthorId(List<Notes> notesList, String authorId) {
    return notesList.where((note) => note.authorId == authorId).toList();
  }
  
  static List<Notes> filterNotesByCollege(List<Notes> notesList, String college) {
    return notesList.where((note) => note.college == college).toList();
  }
  
  static List<Notes> filterNotesByStream(List<Notes> notesList, String stream) {
    return notesList.where((note) => note.stream == stream).toList();
  }
}
