public enum CrashlyticsLogEvent: Equatable {
    case action
    case userId(userId: String)
    case country(country: String)
}

extension CrashlyticsLogEvent {
    public var key: String {
        switch self {
        case .action:
            return "Action"
            
        case .userId:
            return "UserID"
            
        case .country:
            return "Country"
        }
    }
    
    public var value: Any? {
        switch self {
        case .action:
            return "Trigger event button"
            
        case .userId(let userId):
            return userId
            
        case .country(let country):
            return country
        }
    }
}
