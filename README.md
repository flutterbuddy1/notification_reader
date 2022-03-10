# notification_reader

Read Notification in Your Flutter Application.

## Getting Started

### Install Plugin In Your Flutter Project
```
flutter pub add notification_reader
```

### Add This Code in Your AndroidManifest **android/app/src/main/AndroidManifest.xml**. Inside ```<application>``` tag

```xml
<service android:name="com.fluttterbuddy.notification_reader.NotificationService"
    android:label="NotificationService"
    android:exported="true"
    android:permission="android.permission.BIND_NOTIFICATION_LISTENER_SERVICE">
    <intent-filter>
        <action android:name="android.service.notification.NotificationListenerService" />
    </intent-filter>
</service>
```

### Import Plugin in Your Project:

```dart
import 'package:notification_reader/notification_reader.dart';
```

### First Open Notification Reader Setting Using This:
```dart
await NotificationReader.openNotificationReaderSettings;
```

### Get Notification Data:
```dart
NotificationData res = await NotificationReader.onNotificationRecieve();
```

### Notification Data Class:
```dart
res.packageName; // Application Package Name
res.title; // Notification Title
res.body; // Notification Body
res.data; // Data in Json
```

### Buy Me A Coffee

<a href="https://www.buymeacoffee.com/flutterbuddy">
<img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg" height="50" target="_flutterbuddy">
</a>

### Buy Me A Coffee Using PhonePe
<img src="https://flutterbuddy.in/payment.jpg" height="200">
