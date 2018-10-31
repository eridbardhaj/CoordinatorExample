//
//  PhotoDetailsViewController.swift
//  CoordinatorExample
//
//  Created by Erid Bardhaj on 10/31/18.
//  Copyright © 2018 Erid Bardhaj. All rights reserved.
//

import UIKit

protocol PhotoDetailsViewControllerDelegate: class {
    func dismissPhotosGallery()
}

class PhotoDetailsViewController: UIViewController {
    
    
    // MARK: - Properties
    // MARK: Mutable
    
    private weak var delegate: PhotoDetailsViewControllerDelegate?
    
    
    // MARK: - Initializers
    
    init(delegate: PhotoDetailsViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Photo Details"
        view.backgroundColor = .green
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeButtonTapped))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    
    // MARK: - Actions
    
    @objc private func closeButtonTapped() {
        delegate?.dismissPhotosGallery()
    }
}
