//
//  OnboardingViewController.swift
//  CoordinatorExample
//
//  Created by Erid Bardhaj on 10/31/18.
//  Copyright © 2018 Erid Bardhaj. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerDelegate: class {
    func transitionCompleted()
}


class OnboardingViewController: UIViewController {
    
    
    // MARK: - Properties
    // MARK: Mutable
    
    private weak var delegate: OnboardingViewControllerDelegate?
    
    
    // MARK: - Initializers
    
    init(delegate: OnboardingViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        navigationItem.title = "Onboarding"
        view.backgroundColor = .blue
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            self?.delegate?.transitionCompleted()
        }
    }
}
