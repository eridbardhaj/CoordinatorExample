import UIKit

enum PhotosStep: Step {
    case photoGallery
    case photoDetail
    case dismiss
}

class PhotosCoordinator: Coordination {
    
    
    // MARK: - Properties
    // MARK: Immutable
    
    var childCoordinators = [UUID: Coordination]()
    let identifier: UUID
    let dismissable: CoordinatorDismissable?
    private let rootViewController: UINavigationController
    private let photosNavigationController = UINavigationController()
    
    
    // MARK: - Initializers
    
    init(rootViewController: UINavigationController,
         identifier: UUID,
         dismissable: CoordinatorDismissable?) {
        self.rootViewController = rootViewController
        self.identifier = identifier
        self.dismissable = dismissable
    }
    
    
    // MARK: - Protocol Conformance
    // MARK: Coordinatable
    
    func coordinate(to step: Step) {
        guard let step = step as? PhotosStep else { return }
        
        switch step {
        case .photoGallery:
            showPhotoGallery()
        case .photoDetail:
            showPhotoDetail()
        case .dismiss:
            dismiss()
        }
    }
    
    func start() {
        coordinate(to: PhotosStep.photoGallery)
    }
    
    
    // MARK: - Transitions
    
    private func showPhotoGallery() {
        let photoViewController = PhotoGalleryViewController(delegate: self)
        photosNavigationController.setViewControllers([photoViewController], animated: false)
        rootViewController.present(photosNavigationController, animated: true, completion: nil)
    }
    
    private func showPhotoDetail() {
        let photoDetails = PhotoDetailsViewController(delegate: self)
        photosNavigationController.pushViewController(photoDetails, animated: true)
    }
    
    private func dismiss() {
        photosNavigationController.dismiss(animated: true) { [weak self] in
            self?.finish()
        }
    }
}

extension PhotosCoordinator: PhotoGalleryViewControllerDelegate {
    func showPhotoDetailsButtonTapped() {
        coordinate(to: PhotosStep.photoDetail)
    }
}

extension PhotosCoordinator: PhotoDetailsViewControllerDelegate {
    func dismissPhotosGallery() {
        coordinate(to: PhotosStep.dismiss)
    }
}
