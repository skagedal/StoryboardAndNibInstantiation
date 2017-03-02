//
//  Written by Simon Kågedal Reimer 2017, released as public domain.
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
            fatalError("Expected storyboard \(storyboardName) to have a view controller with identifier \(viewControllerIdentifier) of class \(self)")
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
            fatalError("Expected storyboard \(storyboardName) with an initial view controller of class \(self)")
        }
        return viewController
    }
    
    static var storyboardName: String {
        return String(describing: self)
    }
}

protocol NibInstantiable {
    static func instantiate() -> Self
    static var nibName: String { get }
}

extension NibInstantiable {
    static func instantiate() -> Self {
        let nib = UINib(nibName: nibName, bundle: nil)

        guard let object = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Expected nib \(nibName) with a first object of class \(self)")
        }

        return object
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

protocol TableViewCellNibReusable {
    static func register(in tableView: UITableView)
    static func dequeue(in tableView: UITableView, for indexPath: IndexPath) -> Self
    static var nibName: String { get }
}

extension TableViewCellNibReusable {
    static func register(in tableView: UITableView) {
        let identifier = String(describing: self)
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    static func dequeue(in tableView: UITableView, for indexPath: IndexPath) -> Self {
        let identifier = String(describing: self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("Expected table view cell of class \(self) registered with reuse identifier \(identifier) from nib \(nibName)")
        }
        return cell
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

protocol TableViewCellClassReusable: class {
    static func register(in tableView: UITableView)
    static func dequeue(in tableView: UITableView, for indexPath: IndexPath) -> Self
}

extension TableViewCellClassReusable {
    static func register(in tableView: UITableView) {
        let identifier = String(describing: self)
        tableView.register(self, forCellReuseIdentifier: identifier)
    }
    
    static func dequeue(in tableView: UITableView, for indexPath: IndexPath) -> Self {
        let identifier = String(describing: self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("Expected table view cell of class \(self) registered with reuse identifier \(identifier)")
        }
        return cell
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

protocol CollectionViewCellNibReusable {
    static func register(in collectionView: UICollectionView)
    static func dequeue(in collectionView: UICollectionView, for indexPath: IndexPath) -> Self
    static var nibName: String { get }
}

extension CollectionViewCellNibReusable {
    static func register(in collectionView: UICollectionView) {
        let identifier = String(describing: self)
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    static func dequeue(in collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        let identifier = String(describing: self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("Expected collection view cell of class \(self) registered with reuse identifier \(identifier) from nib \(nibName)")
        }
        return cell
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

protocol CollectionViewCellClassReusable: class {
    static func register(in collectionView: UICollectionView)
    static func dequeue(in collectionView: UICollectionView, for indexPath: IndexPath) -> Self
}

extension CollectionViewCellClassReusable {
    static func register(in collectionView: UICollectionView) {
        let identifier = String(describing: self)
        collectionView.register(self, forCellWithReuseIdentifier: identifier)
    }
    
    static func dequeue(in collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        let identifier = String(describing: self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("Expected collection view cell of class \(self) registered with reuse identifier \(identifier)")
        }
        return cell
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

