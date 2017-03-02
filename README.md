# Storyboard and Nib instantiation

This is a set of convention-based protocols and protocol extensions for Swift 3 that provides convenient and type-safe instantiation of view controllers from storyboards and views from nibs, plus registration and reuse of table view cells and collection view cells from both nibs and classes.

## Using conforming classes

To instantiate view controllers and views:

```swift
let viewController = MyViewController.instantiate()
// viewController is typed as MyViewController

let view = MyView.instantiate()
// view is typed as MyView
```

To register a table view cell for reuse:

```swift
MyTableViewCell.register(in: tableView)
```

And to dequeue:

```swift
let cell = MyTableViewCell.dequeue(in: tableView, for: indexPath)
// cell is typed as MyTableViewCell
```

As you see, the user does not need to know exactly how the classes are set up in storyboards, nibs or code; those are implementation details.

## Conforming to the protocols

This works by following a set of naming conventions. The simplest case is where you have a view controller (named, say, `MyViewController`) as the initial view controller in a storyboard with the same name, i.e., `MyViewController.storyboard`. Then set it as `final` and make it adapt to the `StoryboardInitialInstantiable` protocol:

```swift
final class MyViewController: UIViewController, StoryboardInitialInstantiable {

}
```
That's it. Of course, you also have to make sure that the view controller is set to the right class in the storyboard. 

Sometimes you need to instantiate a view controller that's not the initial view controller. In that case, set the view controller's storyboard identifier to the class name and add the following to your class:

```swift
final class MyViewController: UIViewController, StoryboardInstantiable {
	static var storyboardName = "SomeStoryboard"
}
```
In cases where these conventions can't be followed, you may also specify the storyboard name and view controller identifier explicitly:

```swift
final class MyViewController: UIViewController, StoryboardInitialInstantiable {
	static var storyboardName = "SomeStoryboard"
}

final class OtherViewController: UIViewController, StoryboardInstantiable {
	static var storyboardName = "SomeStoryboard"
	static var viewControllerIdentifier = "SomeIdentifier"
}
```

Views that are defined in a nib of the same base name are similarly setup:

```swift
final class MyView: UIView, NibInstantiable {
	
}
```

As before, you may specify the nib name explicitly using the `nibName` static variable. 

For table view cells, conform to the protocol `TableViewCellNibReusable` when the cell is defined in a nib (optionally specified using `nibName`) and `TableViewCellClassReusable` when the cell is defined in code. 

For collection view cells, use `CollectionViewCellNibReusable` and `CollectionViewCellClassReusable`.

## What about view controllers in nibs?

If you prefer nibs for your view controllers, you probably want to use the `init(nibName:bundle:)` initializer anyway, which has the benefit of being able of write custom initializer, which you can't really do with storyboards. 

## Terms of use

This rather simple code is "public domain", free to use however you want.  For more details, see the [CC0 1.0 Universal Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/). 

Feedback is always welcome, send an e-mail to <skagedal@gmail.com>, create an issue or a pull request or send a tweet to @skagedal. 
