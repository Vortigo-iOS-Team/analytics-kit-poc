final class FirebaseProvider {
    private let tracker: AnalyticsTrackerProtocol
    
    init(tracker: AnalyticsTrackerProtocol = AnalyticsTracker()) {
        self.tracker = tracker
    }
    
    private func trackEvent(eventName: String, parameters: [String : Any]?) {
        tracker.logEvent(eventName, parameters: parameters)
    }
}

extension FirebaseProvider: AnalyticsProvider {
    func track(event: AnalyticsEvent) {
        trackEvent(eventName: event.name, parameters: event.parameters)
    }
}
