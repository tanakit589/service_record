

// // ignore_for_file: deprecated_member_use

// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// File _imageFile = File('.');

// class AddImage{
// Future _getFromGallery() async {
//    final pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile  = File(pickedFile.path);
//       });
//     }
//   }
// }


// ElevatedButton.icon(onPressed: (){
//                       _getFromGallery();
//                   }, icon: Icon(Icons.image), label: Text('Add image')
//                   ),
//                   Container(
//                     child: Image.file(
//                       _imageFile,
//                     fit: BoxFit.cover,
//                     ),

                    
//                   ),