//
//  ImageSelectorController.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/9/22.
//

import UIKit

class PostController: UIViewController{
    //MARK: - Properties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Create Post"
    }
    
    //MARK: - Selectors
}

