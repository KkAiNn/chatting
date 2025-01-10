import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

enum ImageViewerType { network, local }

///自定义图片预览页面
class ImageViewer extends StatefulWidget {
  final List<File>? fileUrls;
  final List<String>? imageUrls;
  final String? imageUrl;
  final File? fileUrl;
  final int initialPage;
  final ImageViewerType type;
  final dynamic? tag;

  const ImageViewer({
    super.key,
    this.tag,
    this.fileUrls,
    this.imageUrls,
    this.imageUrl,
    this.fileUrl,
    this.initialPage = 1,
    this.type = ImageViewerType.local,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  List listData = [];
  late int currentPage;
  late int initialPage = 0;
  late dynamic tag;
  // final List<File>? fileUrls;
  // final String? imageUrl;
  // final File? fileUrl;
  // late int initialPage;
  late ImageViewerType type;

  @override
  void initState() {
    super.initState();
    type = widget.type;
    if (type == ImageViewerType.network) {
      listData = widget.imageUrls!;
      tag = widget.imageUrl;
    } else {
      listData = widget.fileUrls!;
      tag = widget.fileUrl;
    }
    initialPage = widget.initialPage;
    currentPage = initialPage + 1;
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> buildImageProvider(int index) {
      if (type == ImageViewerType.network) {
        return NetworkImage(listData[index]);
      }
      return FileImage(listData[index]);
    }

    return GestureDetector(
      onTap: () {
        //点击屏幕关闭本页
        Navigator.pop(context);
      },
      child: Hero(
        tag: tag,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                //多图片预览
                child: PhotoViewGallery.builder(
                  itemCount: listData.length,
                  pageController: PageController(initialPage: initialPage),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index + 1;
                    });
                  },
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: buildImageProvider(index),
                    );
                  },
                ),
              ),
            ),
            //图片张数指示器
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "$currentPage/${listData.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ImageViewer extends StatelessWidget {
//   final List<File>? fileUrls;
//   final List<String>? imageUrls;
//   final String? imageUrl;
//   final File? fileUrl;
//   final int initialPage;
//   final ImageViewerType type;
//   final dynamic? tag;

//   const ImageViewer({
//     super.key,
//     this.tag,
//     this.fileUrls,
//     this.imageUrls,
//     this.imageUrl,
//     this.fileUrl,
//     this.initialPage = 1,
//     this.type = ImageViewerType.local,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List listData = type == ImageViewerType.local ? fileUrls! : imageUrls!;
//     var currentPage = initialPage;

//     ImageProvider<Object> buildImageProvider(int index) {
//       if (type == ImageViewerType.network) {
//         return NetworkImage(listData[index]);
//       }
//       return FileImage(listData[index]);
//     }

//     return GestureDetector(
//       onTap: () {
//         //点击屏幕关闭本页
//         Navigator.pop(context);
//       },
//       child: Hero(
//         tag: tag,
//         child: Stack(
//           children: [
//             Scaffold(
//               backgroundColor: Colors.black,
//               body: Center(
//                 //多图片预览
//                 child: PhotoViewGallery.builder(
//                   itemCount: listData.length,
//                   pageController: PageController(initialPage: initialPage),
//                   onPageChanged: (index) {
//                     // setState(() {
//                     currentPage = index + 1;
//                     // });
//                   },
//                   builder: (context, index) {
//                     return PhotoViewGalleryPageOptions(
//                       imageProvider: buildImageProvider(index),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             //图片张数指示器
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 20,
//               child: Container(
//                 alignment: Alignment.center,
//                 child: Obx(
//                   () => Text(
//                     "$currentPage/${listData.length}",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       decoration: TextDecoration.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
