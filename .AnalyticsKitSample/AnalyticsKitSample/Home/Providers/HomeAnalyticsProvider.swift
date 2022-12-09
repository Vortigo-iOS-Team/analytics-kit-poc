import UIKit
import AnalyticsKit

protocol HomeAnalyticsProviderProtocol: AnyObject {
    func trackEvent(event: AnalyticsEvent)
    func trackCrashlyticsEvent(event: CrashlyticsLogEvent)
}

final class HomeAnalyticsProvider {
    private let analyticsManager: AnalyticsProvider
    
    init(analyticsManager: AnalyticsProvider) {
        self.analyticsManager = analyticsManager
    }
}

extension HomeAnalyticsProvider: HomeAnalyticsProviderProtocol {
    func trackEvent(event: AnalyticsEvent) {
        analyticsManager.track(event: event)
    }
    
    func trackCrashlyticsEvent(event: CrashlyticsLogEvent) {
        analyticsManager.crashlyticsSetCustomValue(event: event)
    }
}
