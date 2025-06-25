import 'dart:convert';

import 'package:chatapp/models/PuserMasseage.dart';
import 'package:chatapp/pusher_services/pusher_services.dart';
import 'package:flutter/foundation.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:riverpod/riverpod.dart';

class PusherController extends StateNotifier<void> {
  final Ref ref;
  final PusherServices pusherServices = PusherServices();
  PusherController(this.ref) : super(null);

  Future<void> init() async {
    await pusherServices.init(
      onEvent: handleEvent,
      onConnectionChange: handleConnectionChange,
      onError: handleError,
    );
  }

  /// Subscribe to user's personal channel
  void subscribeToUser(int userId) {
    final channel = "chat_user_$userId";
    debugPrint("Subscribing to channel: $channel");
    pusherServices.subscribe(channel);
  }

  void handleEvent(PusherEvent event) {
    debugPrint("Event: ${event.eventName}");
    debugPrint("Data: ${event.data}");

    try {
      if (event.data.isEmpty) {
        debugPrint("No data received");
        return;
      }
      final decoded = jsonDecode(event.data);
      final message = Messages.fromMap(decoded["message"]);
      debugPrint("Parsed message: ${message.toMap()}");

      // ref.read(getMessageControllerProvider.notifier).addNewMessage(message);
      // ref.read(getShopsControllerProvider.notifier).getShops();
      // ref.refresh(getTotalUnreadMessagesControllerProvider);
    } catch (e, stk) {
      debugPrint("Error parsing message: $e | $stk");
      return;
    }
  }

  /// Connection change
  void handleConnectionChange(String? current, String? previous) {
    debugPrint("🔌 Pusher state: $previous → $current");
  }

  /// Error
  void handleError(String? message, int? code, dynamic error) {
    debugPrint("Pusher error: $message | code: $code");
  }
}

final pusherControllerProvider = StateNotifierProvider<PusherController, void>((
  ref,
) {
  return PusherController(ref);
});
