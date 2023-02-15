//
//  SideMenuDelegate.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 15/02/23.
//

import Foundation

protocol SideMenuDelegate: AnyObject {
    func menuButtonTapped()
    func itemSelected(item: ContentViewControllerPresentation)
}
