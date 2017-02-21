//
//  Copyright © 2017 Simon Kågedal Reimer. All rights reserved.
//

import UIKit

final class NonInitialViewController: UIViewController, StoryboardInstantiable {

    static var storyboardName = "Various"
    
    // This view controller also demonstrates nib instantiation
    
    @IBOutlet var containerForNibInstantiatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = NibInstantiatedView.instantiate()
        view.frame = containerForNibInstantiatedView.bounds
        view.translatesAutoresizingMaskIntoConstraints = true
        containerForNibInstantiatedView.addSubview(view)
    }
}
