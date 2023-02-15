//
//  ContainerViewComposer.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 15/02/23.
//
import UIKit

final class ContainerViewComposer {
    static func makeContainer() -> ContainerViewController {
        let homeViewController = ContentViewController()
//        let settingsViewController = SettingsViewController()
//        let aboutViewController = AboutViewController()
//        let myAccountViewController = MyAccountViewController()
        let sideMenuItems = [
            SideMenuItem(icon: UIImage(systemName: "house.fill"),
                         name: "Home"),
            SideMenuItem(icon: UIImage(systemName: "gear"),
                         name: "Settings"),
            SideMenuItem(icon: UIImage(systemName: "info.circle"),
                         name: "About"),
            SideMenuItem(icon: UIImage(systemName: "person"),
                         name: "My Account")
        ]
        let sideMenuViewController = SideMenuViewController(sideMenuItems: sideMenuItems)
        let container = ContainerViewController(sideMenuViewController: sideMenuViewController,
                                                rootViewController: homeViewController)

        return container
    }
}

