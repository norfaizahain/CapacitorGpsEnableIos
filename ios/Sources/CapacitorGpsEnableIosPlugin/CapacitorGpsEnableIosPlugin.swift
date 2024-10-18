import Foundation
import CoreLocation
import UIKit
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorGpsEnableIosPlugin)
public class CapacitorGpsEnableIosPlugin: CAPPlugin, CAPBridgedPlugin, CLLocationManagerDelegate{
    var locationManager: CLLocationManager!
    var permissionCallID: String?
    public var window: UIWindow?
    var currentView: UIView!
    var isAlertVisible: Bool = false
    // default set value so dont touch
    public let identifier: String = "CapacitorGpsEnableIosPlugin"
    public let jsName: String = "CapacitorGpsEnableIos"
    public let pluginMethods: [CAPPluginMethod] = [
        // CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        // CAPPluginMethod(name: "isGpsEnabled", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "requestPermissions", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "dismissAlert", returnType: CAPPluginReturnPromise)
    ]
    private let implementation: CapacitorGpsEnableIos = CapacitorGpsEnableIos()

    override public func load() {
        super.load()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }

    // @objc func echo(_ call: CAPPluginCall) {
    //     let value = call.getString("value") ?? ""
    //     call.resolve([
    //         "value": implementation.echo(value)
    //     ])
    // }
    // @objc func isGpsEnabled(_ call: CAPPluginCall) {
    //     let status: Bool = CLLocationManager.locationServicesEnabled()
    //     call.resolve([
    //         "enabled": status
    //     ])
    // }
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
          print(permissionCallID)
         if let callID: String = permissionCallID, let call = bridge?.savedCall(withID:callID) {
             print("callID ada")
            checkPermissions(call)
             bridge?.releaseCall(call)
         }
    }
    @objc public override func requestPermissions(_ call: CAPPluginCall) {
        
        if let manager: CLLocationManager = locationManager, CLLocationManager.locationServicesEnabled() {
            print(CLLocationManager.authorizationStatus())
            if CLLocationManager.authorizationStatus() == .notDetermined {
                bridge?.saveCall(call)
                permissionCallID = call.callbackId
                manager.requestWhenInUseAuthorization()
               
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // Delay before checking permissions
                self.checkPermissions(call)
            }
        
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // Delay before showing alert
            self.showEnableLocationAlert("main")
        }
            
        }
        

    }
    @objc public override func checkPermissions(_ call: CAPPluginCall) {

        let locationState: String
        let authorizationStatus = CLLocationManager.authorizationStatus() // Use this to get the general authorization status

        switch authorizationStatus {
        case .notDetermined:
            locationState = "prompt"
        case .restricted, .denied:
            locationState = "denied"
            self.showEnableLocationAlert("app")
        case .authorizedAlways, .authorizedWhenInUse:
            // Initialize CLLocationManager to check accuracy authorization
            let locationManager = CLLocationManager()

            // Check for accuracy authorization if on iOS 14+
        
            if #available(iOS 14.0, *) {
                if locationManager.accuracyAuthorization == .fullAccuracy {
                    locationState = "granted"  // Precise location is enabled
                    print("Precise location is enabled")
                    self.checkMockLocation()
                } else {
                    locationState = "reducedAccuracy"  // Precise location is disabled
                    print("Precise location is disabled")
                    self.showEnableLocationAlert("preciseLocation")
                }
            } else {
                // For iOS versions below 14, just assume location is granted
                locationState = "granted"
            }
        @unknown default:
            locationState = "prompt"
        }

        
    }
    func showEnableLocationAlert(_ type : String) {
        var url = URL(string: UIApplication.openSettingsURLString);
        var textMessage = "Please enable location services in Settings to allow the app to access your location."

        if(type == "main"){
            url = URL(string: "App-Prefs:root=LOCATION_SERVICES")
        }
        if(type == "preciseLocation"){
            textMessage = "Please enable the 'Precise Location' services in location Settings to allow the app to access your location accurately."
        }
       
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Location Services Disabled",
                message: textMessage,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
                if let settingsUrl = url {
                    UIApplication.shared.open(settingsUrl)
                }
            })
    
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  // 0.5-second delay before notifying cancel
                    print("Notifying cancel action after delay")
                    self.notifyCancelAction()
                }
            })
            await self.isAlertVisible = true
            self.bridge?.viewController?.present(alert, animated: true){
                self.isAlertVisible = true
            }
        }

    }
    func notifyCancelAction() {
        self.notifyListeners("cancelAction", data: ["data":"true"])
    }
    func checkMockLocation(){
        if #available(iOS 15.0, *) {
            let isLocationSimulated: Bool = locationManager.location?.sourceInformation?.isSimulatedBySoftware ?? false
            let isProducedByAccess: Bool = locationManager.location?.sourceInformation?.isProducedByAccessory ?? false
            let info = CLLocationSourceInformation(softwareSimulationState: isLocationSimulated, andExternalAccessoryState: isProducedByAccess)
            print("location simulation info \(info)")
            if info.isSimulatedBySoftware == true || info.isProducedByAccessory == true{

                self.notifyListeners("mockLocationDetected", data: ["isMock": true])

            } else {

                self.notifyListeners("mockLocationDetected", data: ["isMock": false])

            }

        }
    }
    @obj public func dismissAlert(_ call: CAPPluginCall) {
        if isAlertVisible {
            self.bridge?.viewController?.dismiss(animated: true) {
                print("Alert dismissed programmatically")
                self.isAlertVisible = false  // Reset flag when the alert is dismissed
            }
        }
    }
}
