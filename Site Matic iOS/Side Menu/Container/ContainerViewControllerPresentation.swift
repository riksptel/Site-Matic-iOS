//
//  ContainerViewControllerPresentation.swift
//  Site Matic iOS
//
//  Created by Rachit Prajapati on 15/02/23.
//

import UIKit

enum ContentViewControllerPresentation {
    case embed(ContentViewController)
    case push(UIViewController)
    case modal(UIViewController)
}

