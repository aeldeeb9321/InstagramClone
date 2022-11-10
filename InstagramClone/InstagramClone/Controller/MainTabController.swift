//
//  ViewController.swift
//  InstagramClone
//
//  Created by Ali Eldeeb on 11/9/22.
//

import UIKit

class MainTabController: UITabBarController {
    //MARK: - Properties
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }

    //MARK: - Helpers
    
    private func configureViewControllers(){
        view.backgroundColor = .white
        
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let search = SearchController()
        let post = PostController()
        let notifications = NotificationsController()
        let profile = ProfileController()
        
        let feedNC = setupNavController(unselectedImage: UIImage(named: "home_unselected"), selectedImage: UIImage(named: "home_selected"), for: feed)
        let searchNC = setupNavController(unselectedImage: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"), for: search)
        let postNC = setupNavController(unselectedImage: UIImage(named: "plus_unselected"), selectedImage: UIImage(named: "plus_selected"), for: post)
        let notifNC = setupNavController(unselectedImage: UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"), for: notifications)
        let profileNC = setupNavController(unselectedImage: UIImage(named: "profile_unselected"), selectedImage: UIImage(named: "profile_selected"), for: profile)
        
        viewControllers = [feedNC, searchNC, postNC, notifNC, profileNC]
    }
    
    private func setupNavController(unselectedImage: UIImage?, selectedImage: UIImage?,for controller: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: controller)
        nav.tabBarItem.image = unselectedImage?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        nav.navigationBar.tintColor = .black
        return nav
       
    }
    //MARK: - Selectors
    

}

