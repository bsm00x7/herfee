import 'package:flutter/material.dart';
import 'package:herfee/features/auth/data/data.dart';

class ControllerContact extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController messageController = TextEditingController();

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// sender id
  final String currentLoginUserId = SupaBaseData().currentLoginUser;

  Future<void> sendMessage({required String recvId}) async {
    if (messageController.text.trim().isEmpty) return;

    setLoading(true);

    try {
      final messageData = {
        'sendId': currentLoginUserId,
        'content': messageController.text.trim(),
        'recvId': recvId,

      };

     final response = await SupaBaseData().sendMessage(message: messageData);
      // Clear the message input after successful send
      messageController.clear();
    } catch (e) {
      // Handle error appropriately
      debugPrint('Error sending message: $e');
      // You might want to show a snackbar or handle the error in UI
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}