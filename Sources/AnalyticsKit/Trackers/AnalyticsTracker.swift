import FirebaseAnalytics

protocol AnalyticsTrackerProtocol: AnyObject {
    func logEvent(_ eventName: String, parameters: [String : Any]?)
}

final class AnalyticsTracker {
    private let analytics: Analytics.Type
    
    init(analytics: Analytics.Type = Analytics.self) {
        self.analytics = analytics
    }
}

extension AnalyticsTracker: AnalyticsTrackerProtocol {
    func logEvent(_ eventName: String, parameters: [String : Any]?) {
        analytics.logEvent(eventName, parameters: parameters)
    }
}
