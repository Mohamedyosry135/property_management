class MediaTypeEnum{
  static const int photo = 1;
  static const int video = 2;
  static const int record = 3;
}


class RequestStatusEnum{
  static const int notStarted = 1;
  static const int inProgress = 2;
  static const int completed = 3;
  static const int cancelFromProvider = 4;
  static const int cancelFromAdmin = 5;
}