//
//  ViewController.swift
//  StoryboardAndNibInstantiation
//
//  Created by Simon Kågedal Reimer on 2017-02-20.
//  Copyright © 2017 Simon Kågedal Reimer. All rights reserved.
//

import UIKit

class ExamplesViewController: UIViewController {

    @IBAction func initialTapped(_ sender: Any) {
        let vc = InitialViewController.instantiate()
        show(vc, sender: self)
    }
    
    @IBAction func nonInitialTapped(_ sender: UIButton) {
        let vc = NonInitialViewController.instantiate()
        show(vc, sender: self)
    }
    
}

