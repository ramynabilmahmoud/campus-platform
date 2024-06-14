import 'package:image_picker/image_picker.dart';

class CreateCommunityEntity {
  final String? name;
  final String? description;
  final XFile? imageId;
  final bool? isClosed;
  final bool? isPrivate;

  CreateCommunityEntity({
    this.name,
    this.description,
    this.imageId,
    this.isClosed,
    this.isPrivate,
  });
}
