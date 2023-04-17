//
//  MainTabBerController.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class MainTabBerController: UITabBarController {
    
    var customTabBarView = UIView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarUI()
        setupTabBar()
        addCustomTabBarView()
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            setupCustomTabBarFrame()
        }
    func setupTabBar() {
    let onePageViewController = createNavController(vController: OnePageVC(), itemName: "", itemImage: "home")
    let profileViewController = createNavController(vController: ProfileVC(), itemName: "", itemImage: "profile")
//    let massegeViewController = createNavController(vController: OneViewController(), itemName: "", itemImage: "love")
//    let likeViewController = createNavController(vController: TwoViewController(), itemName: "", itemImage: "massage")
//    let basketViewController = createNavController(vController: ThirdViewController(),itemName: "", itemImage: "SaveProduct")
    
//        viewControllers = [onePageViewController, massegeViewController,
//                           basketViewController, likeViewController, profileViewController]
        viewControllers = [onePageViewController, profileViewController]
    }
   private func createNavController(vController: UIViewController,
                                    itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(named: itemImage), tag: 0)
        let ncvController = UINavigationController(rootViewController: vController)
        ncvController.tabBarItem = item
       
        return ncvController
    }
    private func setupCustomTabBarFrame() {
            let height = self.view.safeAreaInsets.bottom + 63
            
            var tabFrame = self.tabBar.frame
            tabFrame.size.height = height
            tabFrame.origin.y = self.view.frame.size.height - height
            
            tabBar.frame = tabFrame
            tabBar.setNeedsLayout()
            tabBar.layoutIfNeeded()
            customTabBarView.frame = tabBar.frame
        }
        
        private func setupTabBarUI() {
            // Setup your colors and corner radius
            tabBar.backgroundColor = Resources.Color.backgroundTabBar
            tabBar.layer.cornerRadius = 30
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            tabBar.tintColor = Resources.Color.active
            tabBar.selectionIndicatorImage = UIImage(named: "Shadow")
            tabBar.unselectedItemTintColor = Resources.Color.inactive
            
            // Remove the line
            if #available(iOS 13.0, *) {
                let appearance = tabBar.standardAppearance
                appearance.shadowImage = nil
                appearance.shadowColor = nil
                tabBar.standardAppearance = appearance
            } else {
                tabBar.shadowImage = UIImage()
                tabBar.backgroundImage = UIImage()
            }
        }
    private func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        
        customTabBarView.backgroundColor = Resources.Color.active
        customTabBarView.layer.cornerRadius = 30
        customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        customTabBarView.layer.masksToBounds = false
        customTabBarView.layer.shadowColor = Resources.Color.active.withAlphaComponent(0.6).cgColor
        customTabBarView.layer.shadowOffset = CGSize(width: -4, height: -6)
        customTabBarView.layer.shadowOpacity = 0.5
        customTabBarView.layer.shadowRadius = 20
        
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
}
