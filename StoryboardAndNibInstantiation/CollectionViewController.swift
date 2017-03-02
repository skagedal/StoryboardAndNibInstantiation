//
//  Created by Simon Kågedal Reimer in 2017.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let collectionView = collectionView else {
            fatalError("Expected to have a collection view")
        }
        NibCollectionViewCell.register(in: collectionView)
        ClassCollectionViewCell.register(in: collectionView)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = NibCollectionViewCell.dequeue(in: collectionView, for: indexPath)
            return cell
        } else {
            let cell = ClassCollectionViewCell.dequeue(in: collectionView, for: indexPath)
            return cell
        }
    }

}
