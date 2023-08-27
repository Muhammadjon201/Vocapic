//
//  ContainerViewController.swift
//  Vocapic
//
//  Created by ericzero on 8/27/23.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private var sideMenuOpen = false
    private var sideMenuViewController: SideMenuViewController!
    private var mainContentViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        setupMainContent()
    }
    
    private func setupSideMenu() {
        sideMenuViewController = SideMenuViewController()
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParent: self)
    }
    
    private func setupMainContent() {
        mainContentViewController = UIViewController() // Your main content view controller
        addChild(mainContentViewController)
        view.addSubview(mainContentViewController.view)
        mainContentViewController.didMove(toParent: self)
    }
    
    func openSideMenu() {
        if sideMenuOpen {
            // Close the side menu
            // Adjust the frames/constraints of sideMenuViewController.view and mainContentViewController.view
        } else {
            // Open the side menu
            // Adjust the frames/constraints of sideMenuViewController.view and mainContentViewController.view
        }
        
        sideMenuOpen = !sideMenuOpen
    }
}
