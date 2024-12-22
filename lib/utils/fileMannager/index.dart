import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  void getTempDir() async {
    Directory tempDir = await getTemporaryDirectory();
    print(tempDir.path);
  }

  Future<File> getFile(String fileName) async {
    //获取应用文件目录类似于iOS的NSDocumentDirectory和Android上的 AppData目录
    final fileDirectory = await getApplicationDocumentsDirectory();
    //获取存储路径
    final filePath = fileDirectory.path;

    //获取文件对象
    // fileDirectory.listSync().forEach((item)=>{
    //   item.
    // });
    //或者file对象（操作文件记得导入import 'dart:io'）
    return File("$filePath/$fileName");
  } //获取存在文件中的数据

  Future getString() async {
    final file = await getFile('file.text');
    var filePath = file.path;
    print(filePath);
    file.readAsString().then((String value) {
      print(value);
      print('$value\n文件存储路径：$filePath');
    });
  }

  // static Future<void> saveFile(String path, String fileName, String content) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/$fileName');
  //   await file.writeAsString(content);
  // }

  // static Future<String> readFile(String fileName) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/$fileName');
  //   return await file.readAsString();
  // }

  static Future<void> deleteFile(String fileName) async {
    // final directory = await getApplicationDocumentsDirectory();
    // final file = File('${directory.path}/$fileName');
    // await file.delete();
  }
}
