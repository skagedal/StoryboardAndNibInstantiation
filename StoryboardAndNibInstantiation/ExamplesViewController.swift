//
//  Created by Simon Kågedal Reimer in 2017.
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

