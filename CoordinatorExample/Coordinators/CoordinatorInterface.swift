import UIKit

protocol Step {}

protocol CoordinatorDismissable: class {
    var childCoordinators: [UUID: Coordination] { get set }
    /// You should never call this directly, as this is intended to be used by the `dismissable` property
    func dispose(with identifier: UUID)
}

protocol Coordinatable: class {
    var identifier: UUID { get }
    var dismissable: CoordinatorDismissable? { get }
    
    func coordinate(to step: Step)
    func start()
    func finish()
}

typealias Coordination = Coordinatable & CoordinatorDismissable

extension Coordinatable {
    func finish() {
        dismissable?.dispose(with: identifier)
    }
}

extension CoordinatorDismissable {
    func dispose(with identifier: UUID) {
        childCoordinators[identifier] = nil
    }
}
