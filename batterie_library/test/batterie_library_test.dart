import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:batterie_library/batterie_library.dart';

void main() {
  const MethodChannel channel = MethodChannel('batterie_library');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BatterieLibrary.platformVersion, '42');
  });
}
