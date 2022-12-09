import AnalyticsKit

struct HomeEvents {
    struct Analytics {
        static let onboardingStepGeolocation: AnalyticsEvent = .onboardingStep(stepName: "geolocation")
        static let onboardingStepCustomStep: AnalyticsEvent = .onboardingStep(stepName: "config.onboardingStep.rawValue")
        static let tutorialBegin: AnalyticsEvent = .tutorialBegin
        static let tutorialComplete: AnalyticsEvent = .tutorialComplete
        static let onboardingStepPassword: AnalyticsEvent = .onboardingStep(stepName: "password")
        static let screenView: AnalyticsEvent = .screenView
        static let customInteraction: AnalyticsEvent = .interaction(itemListName: "itemListName", stepListId: "stepListId")
    }
    
    struct Crashlytics {
        static let action: CrashlyticsLogEvent = .action
        static let userId: CrashlyticsLogEvent = .userId(userId: "3586832435")
        static let country: CrashlyticsLogEvent = .country(country: "Argentina")
    }
}
