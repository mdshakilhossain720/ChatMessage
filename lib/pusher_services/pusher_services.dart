import 'package:flutter/widgets.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherServices {
  static final PusherServices _instance = PusherServices._internal();
  factory PusherServices() => _instance;
  PusherServices._internal();

  late PusherChannelsFlutter _pusher;

  Future<void> init({
    required void Function(PusherEvent) onEvent,
    void Function(String?, String?)? onConnectionChange,
    void Function(String?, int?, dynamic)? onError,
  }) async {
    _pusher = PusherChannelsFlutter.getInstance();
    await _pusher.init(
      apiKey: 'a3cbadc04a202a7746fc',
      cluster: 'mt1',
      onEvent: onEvent,
      onConnectionStateChange: onConnectionChange,
      onError: onError,
    );
    await _pusher.connect();
  }

  void subscribe(String channelName) {
    _pusher.subscribe(channelName: channelName);
    debugPrint('subscribed to $channelName');
  }

  void onPushEvent(PusherEvent event) {
    debugPrint(event.eventName);
    debugPrint(event.data.toString());
  }

  void onSubscriptionSucceeded(String? event, String channelName) {
    debugPrint("Subscription succeeded on $channelName");
  }

  void onConnectionStateChange(String? currentState, String? previousState) {
    debugPrint("Pusher state: $previousState → $currentState");
  }

  void onError(String? message, int? code, dynamic exception) {
    debugPrint("Pusher error: $message (code: $code)");
    if (exception != null) {
      debugPrint("Exception: $exception");
    }
  }
}
