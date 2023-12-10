import 'package:mqtt_client/mqtt_client.dart';

import 'Mqtt Connect.dart';

publishMessage(topic, message) {
  final builder = MqttClientPayloadBuilder();
  builder.addString(message);
  client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
}
