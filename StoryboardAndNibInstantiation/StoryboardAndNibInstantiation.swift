//
//  StoryboardAndNibInstantiation.swift
//  StoryboardAndNibInstantiation
//
//  Created by Simon Kågedal Reimer on 2017-02-20.
//  Copyright © 2017 Simon Kågedal Reimer. All rights reserved.
//

import UIKit

enum ViewControllerIdentifier {
    case initial
    case className
    case specified(String)
}

protocol StoryboardInstantiable {
    /**
        Instantiates a view controller.
     */
    static func instantiate() -> Self
    static var storyboardName: String { get }
    static var viewControllerIdentifier: ViewControllerIdentifier { get }
}

extension StoryboardInstantiable {
    static func instantiate() -> Self {
        
        let storyboardName = (self.storyboardName != "") ? self.storyboardName : String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        switch viewControllerIdentifier {
        case .initial:
            guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
                fatalError("Expected a storyboard named \(storyboardName) with an initial view controller set to class \(self)")
            }
            return viewController

        case .className:
            let identifier = String(describing: self)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
                fatalError("Expected a storyboard named \(storyboardName) with a view controller with identifier \(identifier) set to class \(self)")
            }
            return viewController

        case .specified(let identifier):
            guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
                fatalError("Expected a storyboard named \(storyboardName) with a view controller with identifier \(identifier) set to class \(self)")
            }
            return viewController
        }
    }
    
    static var storyboardName: String { return "" }
    static var viewControllerIdentifier: ViewControllerIdentifier { return .initial }
}

