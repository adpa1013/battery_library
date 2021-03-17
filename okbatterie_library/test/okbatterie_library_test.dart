import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:okbatterie_library/okbatterie_library.dart';

void main() {
  const MethodChannel channel = MethodChannel('okbatterie_library');

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
    expect(await OkbatterieLibrary.platformVersion, '42');
  });
}
