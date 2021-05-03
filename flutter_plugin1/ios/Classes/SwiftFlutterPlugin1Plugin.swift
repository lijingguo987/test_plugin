import Flutter
import UIKit

public class SwiftFlutterPlugin1Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin1", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPlugin1Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    print(call.method)
    result("iOS " + UIDevice.current.systemVersion)
  }
}
