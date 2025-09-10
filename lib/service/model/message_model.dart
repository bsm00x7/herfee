
class MessageModel {
  final String id;
  final String sendId;
  final String content;
  final DateTime createdAt;
  final String recvId;

  MessageModel({required this.id,required  this.sendId,required this.content,  required this.createdAt,required this.recvId});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'sendId': this.sendId,
      'content': this.content,
      'createdAt': this.createdAt,
      'recvId': this.recvId,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      sendId: map['sendId'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] as DateTime,
      recvId: map['recvId'] as String,
    );
  }

}