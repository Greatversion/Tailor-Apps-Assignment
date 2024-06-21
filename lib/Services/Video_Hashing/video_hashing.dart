import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:tailorapp_assignment/DataBase/dataBaseFucntions.dart';


MongoDbManager mongodbmanager = MongoDbManager();

class HashValueExtraction {
  late File file;
  late String generatedHashValue;
  late Map<String, dynamic> metadata;
  Future<File?> pickVideoFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);
    if (result != null) {
      file = File(result.files.single.path!);
      // ignore: avoid_print
      print(result.files.single.path.toString());
      calculateHash(file);
      // return File(result.files.single.path!);
    }
    return null;
  }

  calculateHash(File videoFile) async {
    // Read file metadata
    String name = videoFile.path.split('/').last; // Extract file name
    int size = await videoFile.length(); // Get file size in bytes

    // Additional metadata you might want to include
    metadata = {
      'Title': name,
      'Location': videoFile.parent.path,
      'Type': videoFile.path.split('.').last,
      'Size': size,
      'LastModified': videoFile.lastAccessedSync().toIso8601String(),
      'LastAccessed': videoFile.lastModifiedSync().toIso8601String(),

      // Add more metadata fields as needed
    };

    // Convert metadata to a JSON string
    String metadataString = jsonEncode(metadata);

    // Read video content as bytes
    List<int> videoBytes = await videoFile.readAsBytes();

    // Combine metadata string and video content bytes
    List<int> combinedBytes = utf8.encode(metadataString) + videoBytes;

    // Calculate SHA-256 hash
    var hasher = sha256;
    var hash = hasher.convert(combinedBytes);

    // Return hash as a hexadecimal string
    generatedHashValue = hash.toString();
    metadata.addAll({"generatedHashValue": generatedHashValue});
    if (kDebugMode) {
      print(generatedHashValue);
    }

    if (kDebugMode) {
      print(generatedHashValue);
    }
    mongodbmanager.insertVideoData([metadata]);
  }
}
