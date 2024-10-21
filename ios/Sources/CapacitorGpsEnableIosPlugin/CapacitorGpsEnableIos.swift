import Foundation

@objc public class CapacitorGpsEnableIos: NSObject {
    // @objc public func echo(_ value: String) -> String {
    //     print(value)
    //     return value
    // }
    // @objc public func isGpsEnabled(_ value: String) {
    //     print("Checking if GPS is enabled: \(value)")
    // }
    @objc public func requestPermissions(_ value: String) {
        print("event: \(value)")
    }
    @objc public func dismissAlert(_ value: String) {
        print("event: \(value)")
    }
    @objc public func checkLocationStatus(_ value: String){
        print("event: \(value)")
    }

}
