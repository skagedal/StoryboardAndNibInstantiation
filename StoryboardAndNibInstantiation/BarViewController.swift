//
//  BarViewController.swift
//  StoryboardAndNibInstantiation
//
//  Created by Simon Kågedal Reimer on 2017-02-20.
//  Copyright © 2017 Simon Kågedal Reimer. All rights reserved.
//

import UIKit

final class BarViewController: UIViewController, StoryboardInstantiable {

    static var storyboardName = "Various"
    
    @IBOutlet var containerForNibInstantiatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = NibInstantiatedView.instantiate()
        view.frame = containerForNibInstantiatedView.bounds
        view.translatesAutoresizingMaskIntoConstraints = true
        containerForNibInstantiatedView.addSubview(view)
    }
}
