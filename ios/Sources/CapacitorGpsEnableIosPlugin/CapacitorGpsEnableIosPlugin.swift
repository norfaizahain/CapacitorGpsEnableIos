import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorGpsEnableIosPlugin)
public class CapacitorGpsEnableIosPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CapacitorGpsEnableIosPlugin"
    public let jsName = "CapacitorGpsEnableIos"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = CapacitorGpsEnableIos()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
}