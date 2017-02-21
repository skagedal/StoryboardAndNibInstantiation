//
//  StoryboardAndNibInstantiation.swift
//  StoryboardAndNibInstantiation
//
//  Created by Simon Kågedal Reimer on 2017-02-20.
//  Copyright © 2017 Simon Kågedal Reimer. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
    static func instantiate() -> Self
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String { get }
}

extension StoryboardInstantiable {
    static func instantiate() -> Self {
        
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? Self else {
            fatalError("Expected a storyboard named \(storyboardName) with a view controller with identifier \(viewControllerIdentifier) set to class \(self)")
        }
        return viewController
    }
    
    static var viewControllerIdentifier: String {
        return String(describing: self)
    }
}

protocol StoryboardInitialInstantiable {
    static func instantiate() -> Self
    static var storyboardName: String { get }
}

extension StoryboardInitialInstantiable {
    static func instantiate() -> Self {
        
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Expected a storyboard named \(storyboardName) with an initial view controller set to class \(self)")
        }
        return viewController
    }
    
    static var storyboardName: String {
        return String(describing: self)
    }
}
