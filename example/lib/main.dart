import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:notification_reader/notification_reader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<NotificationData> titleList = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notification Reader'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await NotificationReader.openNotificationReaderSettings;
                  },
                  child: Text("Open Settings")),
              ElevatedButton(
                  onPressed: () async {
                    initPlatformState();
                  },
                  child: const Text("Reload")),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                reverse: true,
                itemCount: titleList != null ? titleList.length : 0,
                itemBuilder: (c, i) {
                  return SizedBox(
                    height: 100,
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(titleList[i].title ?? ""),
                            const Spacer(),
                            Text(titleList[i].body ?? ""),
                            const Spacer(),
                            Text(titleList[i].packageName ?? ""),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    NotificationData res = await NotificationReader.onNotificationRecieve();
    if (res.body != null) {
      Timer.periodic(Duration(seconds: 1), (timer) async {
        var res = await NotificationReader.onNotificationRecieve();
        if (!titleList.contains(res)) {
          setState(() {
            titleList.add(res);
          });
        }
      });
    }
  }
}
