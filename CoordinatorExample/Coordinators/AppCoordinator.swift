import UIKit

enum AppStep: Step {
    case onboarding
    case photos
}

class AppCoordinator: Coordination {
    
    
    // MARK: - Properties
    // MARK: Immutable
    
    let window: UIWindow?
    let identifier = UUID()
    let dismissable: CoordinatorDismissable?
    private lazy var rootViewController = UINavigationController()
    
    // MARK: Mutable
    
    var childCoordinators = [UUID: Coordination]()
    
    
    // MARK: - Initializers
    
    init(window: UIWindow?,
         dismissable: CoordinatorDismissable? = nil) {
        self.window = window
        self.dismissable = dismissable
    }
    
    
    // MARK: - Protocol Conformance
    // MARK: Coordinatable
    
    func coordinate(to step: Step) {
        guard let step = step as? AppStep else { return }
        
        switch step {
        case .onboarding:
            showOnboarding()
        case .photos:
            showPhotosCoordinator()
        }
    }
    
    func start() {
        guard let window = window else { return }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        coordinate(to: AppStep.onboarding)
    }
    
    
    // MARK: - Transitions
    
    private func showOnboarding() {
        let onboardingViewController = OnboardingViewController(delegate: self)
        rootViewController.pushViewController(onboardingViewController, animated: true)
    }
    
    private func showPhotosCoordinator() {
        let identifier = UUID()
        let photosCoordinator = PhotosCoordinator(rootViewController: rootViewController, identifier: identifier, dismissable: self)
        photosCoordinator.start()
        childCoordinators[identifier] = photosCoordinator
    }
    
    private func dismiss() {} // Nothing should happen here
}

extension AppCoordinator: OnboardingViewControllerDelegate {
    func transitionCompleted() {
        coordinate(to: AppStep.photos)
    }
}
