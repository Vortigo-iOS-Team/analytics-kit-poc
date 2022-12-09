import FirebaseCrashlytics

protocol CrashlyticsTrackerProtocol: AnyObject {
    func log(_ logMessage: String)
    func setCustomValue(value: Any?, for key: String)
}

final class CrashlyticsTracker {
    private let crashlytics: Crashlytics
    
    init(crashlytics: Crashlytics = Crashlytics.crashlytics()) {
        self.crashlytics = crashlytics
    }
}

extension CrashlyticsTracker: CrashlyticsTrackerProtocol {
    func log(_ logMessage: String) {
        crashlytics.log(logMessage)
    }
    
    func setCustomValue(value: Any?, for key: String) {
        crashlytics.setCustomValue(value, forKey: key)
    }
}
