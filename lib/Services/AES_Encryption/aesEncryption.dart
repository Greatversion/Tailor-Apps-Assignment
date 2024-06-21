import 'package:encrypt/encrypt.dart' as encrypt;



class AEServices {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  String encryptionAES(textPassword) {
    final encrypted = encrypter.encrypt(textPassword, iv: iv);
    // print(encrypted.base64);
    return encrypted.base64;
  }

  String decryptionAES(encryptedPassword) {
    final decrypted = encrypter.decrypt(encryptedPassword, iv: iv);
    return decrypted;
  }
}


  
