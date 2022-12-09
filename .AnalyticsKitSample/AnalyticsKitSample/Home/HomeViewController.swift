import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Typealias
    private typealias AnalyticsEvents = HomeEvents.Analytics
    private typealias CrashlyticsEvents = HomeEvents.Crashlytics
    
    // MARK: - Views
    private let triggerEventButton: UIButton = {
        $0.setTitle("Trigger event", for: .normal)
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.addTarget(self, action: #selector(didTapTriggerEventButton), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    // MARK: - Properties
    private let analyticsProvider: HomeAnalyticsProviderProtocol
    
    // MARK: - Initialization
    init(analyticsProvider: HomeAnalyticsProviderProtocol) {
        self.analyticsProvider = analyticsProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(triggerEventButton)
        
        NSLayoutConstraint.activate([
            triggerEventButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            triggerEventButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            triggerEventButton.heightAnchor.constraint(equalToConstant: 50),
            triggerEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            triggerEventButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: - Actions
    @objc private func didTapTriggerEventButton() {
        let alert = UIAlertController(title: "Hello World", message: "Your event has been sent successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
        analyticsProvider.trackEvent(event: AnalyticsEvents.onboardingStepGeolocation)
        analyticsProvider.trackEvent(event: AnalyticsEvents.onboardingStepCustomStep)
        analyticsProvider.trackEvent(event: AnalyticsEvents.tutorialBegin)
        analyticsProvider.trackEvent(event: AnalyticsEvents.tutorialComplete)
        analyticsProvider.trackEvent(event: AnalyticsEvents.onboardingStepPassword)
        analyticsProvider.trackEvent(event: AnalyticsEvents.screenView)
        analyticsProvider.trackEvent(event: AnalyticsEvents.customInteraction)
        
        analyticsProvider.trackCrashlyticsEvent(event: CrashlyticsEvents.action)
        analyticsProvider.trackCrashlyticsEvent(event: CrashlyticsEvents.userId)
        analyticsProvider.trackCrashlyticsEvent(event: CrashlyticsEvents.country)
    }
}
