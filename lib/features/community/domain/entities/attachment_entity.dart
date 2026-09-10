import 'package:e_store/core/enums/attachment_type.dart';

class AttachmentEntity {
  final String id;

  final String url;

  final AttachmentType type;

  AttachmentEntity({required this.id, required this.url, required this.type});
}
