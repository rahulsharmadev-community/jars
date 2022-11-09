import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io' as file;

///  An abstract superclass for data readers to keep the type system happy.
abstract class LocaleDataReader {
  Future<String> read();
}

class FileRequestDataReader implements LocaleDataReader {
  /// The base url from which we read the data.
  String path;
  FileRequestDataReader(this.path);

  @override
  Future<String> read() async => await file.File(path).readAsString();
}

class HttpRequestDataReader implements LocaleDataReader {
  /// The base url from which we read the data.
  String url;
  HttpRequestDataReader(this.url);

  @override
  Future<String> read() async {
    var request = await http.get(Uri.parse(url));
    return request.body;
  }
}
