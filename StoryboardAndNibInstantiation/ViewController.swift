//
//  ViewController.swift
//  StoryboardAndNibInstantiation
//
//  Created by Simon Kågedal Reimer on 2017-02-20.
//  Copyright © 2017 Simon Kågedal Reimer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func fooTapped(_ sender: Any) {
        let foo = FooViewController.instantiate()
        show(foo, sender: self)
    }
    
    @IBAction func barTapped(_ sender: UIButton) {
        let bar = BarViewController.instantiate()
        show(bar, sender: self)
    }
    
}

