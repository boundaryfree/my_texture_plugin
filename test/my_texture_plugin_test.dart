import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_texture_plugin/my_texture_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('my_texture_plugin');

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
    expect(await MyTexturePlugin.platformVersion, '42');
  });
}
