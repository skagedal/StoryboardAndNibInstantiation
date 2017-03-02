//
//  Created by Simon Kågedal Reimer in 2017.
//

import UIKit

final class ClassCollectionViewCell: UICollectionViewCell, CollectionViewCellClassReusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CLS"
        contentView.addSubview(label)
        contentView.addConstraints([
            contentView.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: label.centerYAnchor)
            ])
    }
}
