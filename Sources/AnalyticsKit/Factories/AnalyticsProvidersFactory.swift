public final class AnalyticsProvidersFactory {
    public static func makeProvidersWithKeys(_ keys: Keys) -> [AnalyticsProvider] {
        FirebaseFactory.initialize()

        let appsflyer = AppsFlyerProvider(devKey: keys.appsFlyerDevKey, appID: keys.appleAppID)
        let firebase = FirebaseProvider()
        let crashlytics = CrashlyticsProvider()
        
        let providers: [AnalyticsProvider] = [appsflyer, firebase, crashlytics]
        return providers
    }
}
