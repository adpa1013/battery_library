import Flutter
import UIKit

public class SwiftOkbatterieLibraryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "okbatterie_library", binaryMessenger: registrar.messenger())
    let instance = SwiftOkbatterieLibraryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
