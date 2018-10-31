//
//  PhotoGalleryViewController.swift
//  CoordinatorExample
//
//  Created by Erid Bardhaj on 10/31/18.
//  Copyright © 2018 Erid Bardhaj. All rights reserved.
//

import UIKit

protocol PhotoGalleryViewControllerDelegate: class {
    func showPhotoDetailsButtonTapped()
}

class PhotoGalleryViewController: UIViewController {
    
    
    // MARK: - Properties
    // MARK: Mutable
    
    private weak var delegate: PhotoGalleryViewControllerDelegate?
    
    
    // MARK: - Initializers
    
    init(delegate: PhotoGalleryViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Photo Gallery"
        view.backgroundColor = .red
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(showButtonTapped))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    
    // MARK: - Actions
    
    @objc private func showButtonTapped() {
        delegate?.showPhotoDetailsButtonTapped()
    }
}
