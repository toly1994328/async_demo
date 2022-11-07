import 'dart:io';

import 'package:path/path.dart' as path;

void main(){
  String filePath = path.join(Directory.current.path, "lib", "github",'main.dart');
  File file = File(filePath);
  file.readAsString().then((value){
    print('==========================');
  });







}