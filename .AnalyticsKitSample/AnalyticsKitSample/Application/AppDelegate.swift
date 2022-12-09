import UIKit
import AnalyticsKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let analyticsManager = AnalyticsManager.sharedInstance
        let analyticsProvider = HomeAnalyticsProvider(analyticsManager: analyticsManager)
        let rootViewController = HomeViewController(analyticsProvider: analyticsProvider)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = rootViewController
        self.window = window
        return true
    }
}
