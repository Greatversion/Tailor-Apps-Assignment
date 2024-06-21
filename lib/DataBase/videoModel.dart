// class VideoModel {
//   String? title;
//   String? location;
//   String? type;
//   int? size;
//   String? lastModified;
//   String? lastAccessed;

//   VideoModel(
//       {this.title,
//       this.location,
//       this.type,
//       this.size,
//       this.lastModified,
//       this.lastAccessed});

//   VideoModel.fromJson(Map<String, dynamic> json) {
//     title = json['name'];
//     location = json['location'];
//     type = json['type'];
//     size = json['size'];
//     lastModified = json['lastModified'];
//     lastAccessed = json['lastAccessed'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.title;
//     data['location'] = this.location;
//     data['type'] = this.type;
//     data['size'] = this.size;
//     data['lastModified'] = this.lastModified;
//     data['lastAccessed'] = this.lastAccessed;
//     return data;
//   }
// }
