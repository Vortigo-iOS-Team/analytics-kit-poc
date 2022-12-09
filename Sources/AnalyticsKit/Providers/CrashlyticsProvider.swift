final class CrashlyticsProvider {
    private let tracker: CrashlyticsTrackerProtocol
    
    init(tracker: CrashlyticsTrackerProtocol = CrashlyticsTracker()) {
        self.tracker = tracker
    }
    
    private func logEvent(logMessage: String) {
        tracker.log(logMessage)
    }
    
    private func setCustomValue(value: Any?, for key: String) {
        tracker.setCustomValue(value: value, for: key)
    }
}

extension CrashlyticsProvider: AnalyticsProvider {
    func track(event: AnalyticsEvent) {
        logEvent(logMessage: event.name)
    }
    
    func crashlyticsSetCustomValue(event: CrashlyticsLogEvent) {
        setCustomValue(value: event.value, for: event.key)
    }
}
