import 'dart:typed_data';

class WeatherMapModel {
  WeatherMapModel({this.uint8list});
  final Uint8List? uint8list;
  factory WeatherMapModel.fromByteData(ByteData byteData) {
    final Uint8List bytes = byteData.buffer.asUint8List();
    return WeatherMapModel(uint8list: bytes);
  }
}
