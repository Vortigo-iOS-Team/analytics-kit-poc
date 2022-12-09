public enum AnalyticsEvent: Equatable {
    case onboardingStep(stepName: String)
    case tutorialBegin
    case tutorialComplete
    case screenView
    case interaction(itemListName: String, stepListId: String)
}

extension AnalyticsEvent {
    public var name: String {
        switch self {
        case .onboardingStep:
            return "onboarding_step"
            
        case .tutorialBegin:
            return "tutorial_begin"
            
        case .tutorialComplete:
            return "tutorial_complete"
            
        case .screenView:
            return "screen_view"
            
        case .interaction:
            return "interaction"
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .onboardingStep(let stepName):
            return ["step_name": stepName]
            
        case .screenView:
            return ["screen_name": "logged-area:cash-in",
                    "app_context": "logged-area",
                    "step_name": "cash-in"]
            
        case .interaction(let itemListName, let stepListId):
            return ["screen_name": "logged-area:cash-in",
                    "app_context": "logged-area",
                    "step_name": "cash-in",
                    "item_list_name": itemListName,
                    "step_list_id": "logged-area:cash-in:\(stepListId)"]
            
        default:
            return nil
        }
    }
}
