import 'dart:io';

import 'package:flutter/services.dart';
import 'package:iot_clock/Constants/variables.dart';
import 'package:iot_clock/MQTT%20modules/Alarm%20Callback.dart';
import 'package:iot_clock/MQTT%20modules/Stopwatch%20Callback.dart';
import 'package:iot_clock/MQTT%20modules/Timer%20Callback.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


const serverAddress = 'a3ae40dpgvac3t-ats.iot.us-east-1.amazonaws.com';
const clientID = 'Clock App';
final MqttServerClient client = MqttServerClient.withPort(serverAddress, clientID, 8883);

Future<bool> mqttConnect() async {
  print('Connecting to MQTT Broker...');

  ByteData rootCA = await rootBundle.load('Assets/Certificates/AmazonRootCA1.pem');
  ByteData deviceCert = await rootBundle.load('Assets/Certificates/certificate.pem.crt');
  ByteData privateKey = await rootBundle.load('Assets/Certificates/private.pem.key');

  final context = SecurityContext.defaultContext;
  context.setClientAuthoritiesBytes(rootCA.buffer.asUint8List());
  context.useCertificateChainBytes(deviceCert.buffer.asUint8List());
  context.usePrivateKeyBytes(privateKey.buffer.asUint8List());


  // Set the protocol to V3.1.1 for AWS IoT Core, if you fail to do this you will not receive a connect ack with the response code
  client.setProtocolV311();
  client.securityContext = context;
  client.logging(on: true);
  client.keepAlivePeriod = 20;
  client.secure = true;
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.pongCallback = pong;

  final connMess = MqttConnectMessage().withClientIdentifier(clientID).startClean();
  client.connectionMessage = connMess;

  try {
    print('MQTT client connecting to AWS IoT using certificates....');
    await client.connect();
  } on Exception catch (e) {
    print('MQTT client exception - $e');
    client.disconnect();
    return false;
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print("Connected to AWS Successfully!");
  } else {
    return false;
  }
  // connection success

  // initiate listeners callbacks
  client.subscribe(alarmTopic, MqttQos.atLeastOnce);
  client.subscribe(timerTopic, MqttQos.atLeastOnce);
  client.subscribe(stopwatchTopic, MqttQos.atLeastOnce);
  // Print incoming messages from another client on this topic
  client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    final recMess = c[0].payload as MqttPublishMessage;
    final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print('EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');

    if(c[0].topic == alarmTopic){
      alarmCallback(pt);
    }
    else if(c[0].topic == timerTopic){
      timerCallback(pt);
    }
    else if(c[0].topic == stopwatchTopic){
      stopwatchCallback(pt);
    }
  });

  return true;
}

onConnected(){
  print('connected succesfully');
}

onDisconnected(){
  print("Client Disconnected");
}

pong(){
  print("received a ping msg");
}
