import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/domain/entity/course/course_participant_entity.dart';
import 'package:main_platform/app/presentation/widgets/avatar_stack_widget.dart';
import 'package:main_platform/core/constants/theme_constants.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget(
      {super.key,
      required this.courseName,
      required this.ownerName,
      required this.someParticiaptns});

  final String courseName;
  final String ownerName;
  final List<CourseParticipantEntity> someParticiaptns;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class CoursePreviewWidget extends StatefulWidget {
//   const CoursePreviewWidget(
//       {super.key,
//       required this.courseName,
//       required this.onImageEdit,
//       this.imagePath,
//       this.tags = const []});

//   final String? imagePath;
//   final void Function() onImageEdit;
//   final String courseName;
//   final List<String> tags;

//   @override
//   State<CoursePreviewWidget> createState() => _CoursePreviewWidgetState();
// }

// class _CoursePreviewWidgetState extends State<CoursePreviewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       clipBehavior: Clip.hardEdge,
//       child: ClipRRect(
//           child: Stack(
//         children: [
//           Container(
//             color: theme.colorScheme.surface,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 widget.imagePath != null
//                     ? ((widget.imagePath!.contains("://") || kIsWeb)
//                         ? Image.network(widget.imagePath!,
//                             height: xCourseImageHeight,
//                             fit: BoxFit.fitWidth,
//                             width: double.infinity)
//                         : Image.file(File(widget.imagePath!),
//                             height: xCourseImageHeight,
//                             fit: BoxFit.fitWidth,
//                             width: double.infinity))
//                     : Container(
//                         height: xCourseImageHeight,
//                         color: theme.colorScheme.inverseSurface),
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Flexible(
//                             child: Text(widget.courseName,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 2,
//                                 style: const TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.w900)),
//                           ),
//                           const SizedBox(width: 50),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                           alignment: WrapAlignment.start,
//                           crossAxisAlignment: WrapCrossAlignment.start,
//                           spacing: 5,
//                           runSpacing: 5,
//                           children: List.generate(
//                               widget.tags.length,
//                               (index) => ActionChip(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(100)),
//                                   onPressed: () {},
//                                   elevation: 0,
//                                   side: BorderSide.none,
//                                   label: Text(widget.tags[index])))),
//                       const SizedBox(height: 10),
//                       AvatarStackWidget(children: [
//                         CircleAvatar(
//                             backgroundImage:
//                                 Image.asset('assets/images/avatar.png').image),
//                         CircleAvatar(
//                             backgroundImage:
//                                 Image.asset('assets/images/avatar.png').image),
//                         CircleAvatar(
//                           backgroundColor: theme.colorScheme.primary,
//                           foregroundColor: theme.colorScheme.onPrimary,
//                           child: const Text("+99"),
//                         )
//                       ]),
//                       SizedBox(
//                           width: double.infinity,
//                           child: FilledButton(
//                             child: const Padding(
//                               padding: EdgeInsets.all(10),
//                               child: Text("View"),
//                             ),
//                             style: FilledButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                             onPressed: () {},
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned.directional(
//             textDirection: Directionality.of(context),
//             end: 15,
//             top: 15,
//             child: IconButton(
//               tooltip: "Edit",
//               style: FilledButton.styleFrom(
//                   backgroundColor: theme.colorScheme.primary, elevation: 15),
//               onPressed: widget.onImageEdit,
//               icon: const Icon(Icons.edit),
//               color: theme.colorScheme.onPrimary,
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
