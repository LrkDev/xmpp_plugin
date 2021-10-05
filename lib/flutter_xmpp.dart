import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';

class FlutterXmpp {
  static const MethodChannel _channel = MethodChannel('flutter_xmpp/method');
  static const EventChannel _eventChannel = EventChannel('flutter_xmpp/stream');
  static late StreamSubscription streamGetMsg;

  dynamic auth;

  FlutterXmpp(this.auth);

  Future<void> login() async {
    print("futurelogin${auth}");
    await _channel.invokeMethod('login', auth);
  }

  Future<void> logout() async {
    await _channel.invokeMethod('logout');
  }

  //conversationType: 0 = normal
  //conversationType: 1 = group
  Future<String> sendMessage(String toJid, String body, String id) async {
    final params = {
      "to_jid": toJid,
      "body": body,
      "id": id,
    };
    final String status = await _channel.invokeMethod('send_message', params);
    return status;
  }

  Future<String> sendMessageWithType(
      String toJid, String body, String id) async {
    final params = {"to_jid": toJid, "body": body, "id": id};
    final String status = await _channel.invokeMethod('send_message', params);
    return status;
  }

  Future<String> sendGroupMessage(String toJid, String body, String id) async {
    final params = {
      "to_jid": toJid,
      "body": body,
      "id": id,
    };
    final String status =
        await _channel.invokeMethod('send_group_message', params);
    return status;
  }

  Future<String> sendGroupMessageWithType(
      String toJid, String body, String id) async {
    final params = {"to_jid": toJid, "body": body, "id": id};
    final String status =
        await _channel.invokeMethod('send_group_message', params);
    return status;
  }

  Future<void> start(void Function(dynamic) _onEvent, Function _onError) async {
    streamGetMsg = _eventChannel
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  Future<void> stop() async {
    streamGetMsg.cancel();
  }

  Future<void> joinMucGroups(List<String> allGroupsId) async {
    if (allGroupsId.isNotEmpty) {
      final params = {
        "all_groups_ids": allGroupsId,
      };
      printLogForMethodCall('join_muc_groups', params);
      await _channel.invokeMethod('join_muc_groups', params);
    }
  }

  void printLogForMethodCall(String methodName, dynamic params) {
    log('call method to app from flutter methodName: $methodName: params: $params');
  }
}
