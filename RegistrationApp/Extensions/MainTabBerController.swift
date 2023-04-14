//
//  MainTabBerController.swift
//  RegistrationApp
//
//  Created by Viktor Morozov on 14.04.23.
//

import UIKit

final class MainTabBerController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setTabBarAppearence()
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
   private func setTabBarAppearence() {
       let positionOnX: CGFloat = -5
       let positionOnY: CGFloat = 20

       let wight = tabBar.bounds.width - positionOnX * 2
       let height = tabBar.bounds.height + positionOnY 

       let raundLayer = CAShapeLayer()
       let beziePath = UIBezierPath(roundedRect: CGRect(x: positionOnX,
                                                        y: tabBar.bounds.minY, width: wight, height: height),
                                    cornerRadius: height / 2 )
       raundLayer.path = beziePath.cgPath

       tabBar.layer.insertSublayer(raundLayer, at: 0)
       tabBar.itemWidth = wight / 2
       tabBar.shadowImage = UIImage(named: "Shadow")
       tabBar.itemPositioning = .centered
       raundLayer.fillColor = UIColor.backgroundCastumColor.cgColor
       tabBar.tintColor = .black
       tabBar.unselectedItemTintColor = .blue
    }
}
