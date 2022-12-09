final class AppsFlyerProvider {
    private var tracker: AppsFlyerTrackerProtocol
    
    init(devKey: String, appID: String, tracker: AppsFlyerTrackerProtocol = AppsFlyerTracker()) {
        self.tracker = tracker
        self.tracker.appsFlyerDevKey = devKey
        self.tracker.appleAppID = appID
        self.tracker.isDebug = false
        self.tracker.start()
    }
    
    private func trackEvent(eventName: String, parameters: [AnyHashable : Any]?) {
        tracker.logEvent(eventName, withValues: parameters)
    }
}

extension AppsFlyerProvider: AnalyticsProvider {
    func track(event: AnalyticsEvent) {
        trackEvent(eventName: event.name, parameters: event.parameters)
    }
}
