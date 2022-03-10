class NotificationData{
  String? title;
  String? body;
  String? packageName;
  dynamic data; // All Data in Json
  NotificationData({
    this.title,
    this.body,
    this.packageName,
    this.data
});
}