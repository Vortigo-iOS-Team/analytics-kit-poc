import UIKit

public typealias AnalyticsProvider = AnalyticsManagerProtocol & CrashlyticsProtocol

public protocol AnalyticsManagerProtocol: AnyObject {
    func track(event: AnalyticsEvent)
}

public protocol CrashlyticsProtocol {
    func crashlyticsSetCustomValue(event: CrashlyticsLogEvent)
}

public extension CrashlyticsProtocol {
    func crashlyticsSetCustomValue(event: CrashlyticsLogEvent) {}
}

public final class AnalyticsManager {
    static private var registeredProviders: [AnalyticsProvider] = {
        guard let keys = KeysDecoder.decode() else {
            return []
        }
        return AnalyticsProvidersFactory.makeProvidersWithKeys(keys)
    }()
    
    private let providers: [AnalyticsProvider]
    public static let sharedInstance = AnalyticsManager(providers: AnalyticsManager.registeredProviders)
    
    public init(providers: [AnalyticsProvider]) {
        self.providers = providers
    }
}

extension AnalyticsManager: AnalyticsProvider {
    public func track(event: AnalyticsEvent) {
        providers.forEach { $0.track(event: event) }
    }
    
    public func crashlyticsSetCustomValue(event: CrashlyticsLogEvent) {
        providers.forEach { $0.crashlyticsSetCustomValue(event: event) }
    }
}
