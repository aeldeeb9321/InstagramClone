//
//  NotificationController.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/9/22.
//

import UIKit

class NotificationsController: UIViewController{
    //MARK: - Properties
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    private func configureUI(){
        navigationItem.title = "Notifications"
    }
    
    //MARK: - Selectors
}

