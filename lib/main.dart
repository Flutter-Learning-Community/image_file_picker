
import 'dart:convert';
import 'dart:io'as Io;
import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  
      var result;

  @override
  Widget build(BuildContext context) {
    var file;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        
         
            child:ElevatedButton(onPressed: () async{
     


print("object");
              final result = await FilePicker.platform.pickFiles();
             if(result == null)
         
              return;
  
              file = result.files.first;
             final bytes = Io.File(file.path).readAsBytesSync();

String img64 = base64Encode(bytes);
print(img64);

    print("object");
            openFile(file);
         
            }, child: Text("Pick a file"),),
      ), 
    );  
  }

  


  void openFile(PlatformFile file) {
      OpenFile.open(file.path!);
   

  }



}