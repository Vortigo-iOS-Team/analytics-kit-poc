import AppsFlyerLib
import AppTrackingTransparency
import AdSupport

protocol AppsFlyerTrackerProtocol: AnyObject {
    var appsFlyerDevKey: String { get set }
    var appleAppID: String { get set }
    var isDebug: Bool { get set }
    
    func start()
    func logEvent(_ eventName: String, withValues values: [AnyHashable: Any]?)
}

final class AppsFlyerTracker: AppsFlyerTrackerProtocol {
    private let appsFlyer: AppsFlyerLib
    var appsFlyerDevKey: String = ""
    var appleAppID: String = ""
    var isDebug: Bool = false
    
    init(appsFlyer: AppsFlyerLib = AppsFlyerLib.shared()) {
        self.appsFlyer = appsFlyer
    }
    
    private func requestATTPermission() {
        if #available(iOS 14, *) {
            appsFlyer.waitForATTUserAuthorization(timeoutInterval: 60)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                ATTrackingManager.requestTrackingAuthorization { status in
                    switch status {
                    case .authorized:
                        print("Device IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
                        
                    default:
                        break
                    }
                }
            }
        }
    }
    
    // MARK: - AppsFlyerTrackerProtocol
    func start() {
        requestATTPermission()
        
        appsFlyer.appsFlyerDevKey = appsFlyerDevKey
        appsFlyer.appleAppID = appleAppID
        appsFlyer.isDebug = isDebug
        appsFlyer.start()
    }
    
    func logEvent(_ eventName: String, withValues values: [AnyHashable: Any]?) {
        appsFlyer.logEvent(eventName, withValues: values)
    }
}
