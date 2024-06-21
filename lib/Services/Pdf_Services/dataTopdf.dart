import 'dart:io';
import 'package:open_file/open_file.dart'; // For opening the file
import 'package:path_provider/path_provider.dart';

class CreatePDF {
  createPDF(String username, String password, String encryptedText) async {
    // Constructing the PDF content
    String pdfContent = '''
    %PDF-1.7
    1 0 obj
    << /Type /Catalog /Pages 2 0 R >>
    endobj
    2 0 obj
    << /Type /Pages /Kids [3 0 R] /Count 1 >>
    endobj
    3 0 obj
    << /Type /Page /Parent 2 0 R /Resources << /Font << /F1 4 0 R >> >>
    /Contents 5 0 R >>
    endobj
    4 0 obj
    << /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>
    endobj
    5 0 obj
    << /Length 58 >>
    stream
    BT
    50 750 Td
    /F1 24 Tf
    (Name: $username) Tj
    0 -28 Td
    (Password: $password) Tj
    0 -28 Td
    (Encrypted Text: $encryptedText) Tj
    ET
    endstream
    endobj
    xref
    0 6
    0000000000 65535 f 
    0000000009 00000 n 
    0000000054 00000 n 
    0000000123 00000 n 
    0000000184 00000 n 
    0000000248 00000 n 
    trailer
    << /Size 6 /Root 1 0 R >>
    startxref
    287
    %%EOF
  ''';

    // Get the temporary directory of the device
    Directory tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/Assignment Data.pdf';

    // Write the constructed PDF content to a file
    File(filePath).writeAsStringSync(pdfContent);

    // Open the PDF file
    OpenFile.open(filePath);
  }
}
