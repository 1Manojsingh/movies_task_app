// import 'dart:io';
//
// import 'package:bookmytask/core/theme/app_colors.dart';
// import 'package:bookmytask/core/theme/text_theme.dart';
// import 'package:bookmytask/core/utility/design_utility.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
//
// class MediaPickerUtility {
//   static Future<XFile?> pickMedia(BuildContext context,
//       {FileType? type,
//       List<String>? allowedExtensions,
//       bool allowMultiple = false}) async {
//     if (kIsWeb) {
//       final result = await FilePicker.platform.pickFiles(
//         type: type ?? FileType.any,
//         allowedExtensions: allowedExtensions,
//         allowMultiple: allowMultiple,
//       );
//       final file = result?.files.firstOrNull;
//       if (file != null) {
//         final Uint8List fileBytes = file.bytes!;
//         final String fileName = file.name;
//
//         final xfile = XFile.fromData(
//           fileBytes,
//           name: fileName,
//           mimeType: lookupMimeType(fileName, headerBytes: fileBytes),
//         );
//         return xfile;
//       }
//       return null;
//     } else if (Platform.isAndroid || Platform.isIOS) {
//       final source = await showDialog<MediaPickerSource?>(
//         context: context,
//         builder: (context) => const _MediaPickerSourceDialog(),
//       );
//       if (source == null) {
//         return null;
//       }
//       if (source == MediaPickerSource.gallery) {
//         if (allowMultiple) {
//           final result = await ImagePicker().pickMultiImage(imageQuality: 85);
//           return result.first;
//         } else {
//           final result = await ImagePicker()
//               .pickImage(source: ImageSource.gallery, imageQuality: 85);
//           return result;
//         }
//       } else if (source == MediaPickerSource.camera) {
//         final result = await ImagePicker()
//             .pickImage(source: ImageSource.camera, imageQuality: 85);
//         return result;
//       } else if (source == MediaPickerSource.files) {
//         final result = await FilePicker.platform.pickFiles(
//           type: type ?? FileType.any,
//           allowedExtensions: allowedExtensions,
//           allowMultiple: allowMultiple,
//         );
//         return XFile.fromData(
//             Uint8List.fromList(result?.files.first.bytes ?? []),
//             mimeType: result?.files.first.extension ?? '',
//             name: result?.files.first.name ?? '');
//       }
//     } else {
//       throw UnimplementedError(
//           'Media picker is not implemented for this platform');
//     }
//     return null;
//   }
// }
//
// enum MediaPickerSource {
//   gallery,
//   camera,
//   files,
// }
//
// class _MediaPickerSourceDialog extends StatelessWidget {
//   const _MediaPickerSourceDialog();
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//         key: const ValueKey('media_picker_source_dialog'),
//         title: const Text('Select Source'),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         children: [
//           SimpleDialogOption(
//             child: Row(
//               children: [
//                 const Icon(Icons.image, color: AppColors.primary),
//                 horizontalSpaceSmall,
//                 Text('Gallery',
//                     style: appTextTheme.bodyMedium
//                         ?.copyWith(color: AppColors.primary)),
//               ],
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(MediaPickerSource.gallery);
//             },
//           ),
//           SimpleDialogOption(
//             child: Row(
//               children: [
//                 const Icon(Icons.camera, color: AppColors.primary),
//                 horizontalSpaceSmall,
//                 Text('Camera',
//                     style: appTextTheme.bodyMedium
//                         ?.copyWith(color: AppColors.primary)),
//               ],
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(MediaPickerSource.camera);
//             },
//           ),
//           SimpleDialogOption(
//             child: Row(
//               children: [
//                 const Icon(Icons.file_present, color: AppColors.primary),
//                 horizontalSpaceSmall,
//                 Text('Files',
//                     style: appTextTheme.bodyMedium
//                         ?.copyWith(color: AppColors.primary)),
//               ],
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(MediaPickerSource.files);
//             },
//           ),
//         ]);
//   }
// }
