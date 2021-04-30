import 'dart:async';

abstract class StreamProtocol {
  void addValue(var val);
  void close();
}

class StreamClient implements StreamProtocol {
  static StreamClient sharedInstance = StreamClient._();
  final StreamController controller = StreamController();

  StreamSink<dynamic> get sink => controller.sink;
  Stream get stream => controller.stream;

  StreamClient._();

  @override
  void addValue(var val) {
    sink.add(val);
  }

  @override
  void close() {
    controller.close();
  }
}