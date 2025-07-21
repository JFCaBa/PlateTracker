//
//  MainTabViewController.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private let scanViewModel = ScanViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let scanVC = ScanViewController()
        scanVC.tabBarItem = UITabBarItem(title: "Scan", image: UIImage(systemName: "camera"), tag: 0)
        scanVC.configure(with: scanViewModel)
        
        let resultsVC = ResultsViewController()
        resultsVC.tabBarItem = UITabBarItem(title: "Results", image: UIImage(systemName: "list.bullet"), tag: 1)
        resultsVC.configure(with: scanViewModel)
        
        let mapVC = MapViewController()
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 2)
        mapVC.configure(with: scanViewModel)
        
        viewControllers = [
            UINavigationController(rootViewController: scanVC),
            UINavigationController(rootViewController: resultsVC),
            UINavigationController(rootViewController: mapVC)
        ]
    }
}
