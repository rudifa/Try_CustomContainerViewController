#  Experiment with custom Container View Controller

### Code ideas and patterns

**(1)** [Managing View Controllers With Container View Controllers](https://cocoacasts.com/managing-view-controllers-with-container-view-controllers/)

Teaches how to instantiate **custom view controllers** from a storyboard, and how to hook these controllers into a Master container controller.

*A container view controller embeds the content of other view controllers into its own root view.*

**(2)** [Swift: UIStoryboard Protocol](https://medium.com/swift-programming/uistoryboard-safer-with-enums-protocol-extensions-and-generics-7aad3883b44d)

Teaches tricks with enums and generics to simplify the **instantiation of custom view controllers** from storyboards.

**(3)** [Passing Data Between View Controllers in iOS: The Definitive Guide](https://matteomanferdini.com/how-ios-view-controllers-communicate-with-each-other/)

A useful overview.

**(4)** [Why you shouldn’t use delegates in Swift](http://marinbenc.com/why-you-shouldnt-use-delegates-in-swift)

Argues in favor of using callbacks instead of delegate (less coupling, less fuss).

**(5)** [iOS: Three ways to pass data from Model to Controller](https://medium.com/@stasost/ios-three-ways-to-pass-data-from-model-to-controller-b47cc72a4336)

Callbacks, delegation and notification compared.

**(6)** [Swift State Machines, Part 2/3/4](http://www.figure.ink/blog/2015/2/1/swift-state-machines-part-2)

Uses ```switch(state, event)```to specify allowed transitions.

### My adaptations

My function ```instantiateFromStoryboard<T>``` is a simplified version (hardcoded for Main.storyboard) of code shown in **(2)**.

```
func instantiateFromStoryboard<T: UIViewController>() -> T {
    // load storyboard, instantiate controller and return it
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let className = String(describing: T.self)
    guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? T else {
        fatalError("Could not instantiate a view controller with name: \(className)")
    }
    return viewController
}
```
Example:
```
private lazy var redViewController: RedViewController = instantiateFromStoryboard()
```

In ```class MasterViewController: UIViewController ``` I add two functions for hooking-in / unhooking child controllers, per **(1)**:

```

    func add(asChildViewController viewController: UIViewController) {
        // add child
        addChildViewController(viewController)
        // add child view as subview and configure it
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // notify child view controller
        viewController.didMove(toParentViewController: self)
    }
```

```
    func remove(asChildViewController viewController: UIViewController) {
        // notify child
        viewController.willMove(toParentViewController: nil)
        // remove child view from superview
        viewController.view.removeFromSuperview()
        // notify child view controller
        viewController.removeFromParentViewController()
    }
```

I use a simple state machine in MasterViewController.

```
enum State {
    case red, green, blue
}

enum Event {
    case cancel, done
}

class StateMachine: NSObject {
    private var state: State = .red

    func nextState(event: Event) -> State {
        switch (state, event) {
        case (.red, .done): state = .green
        case (.green, .done): state = .blue
        case (.blue, .done): state = .red
        case (_, .cancel): state = .red
        }
        return state
    }

    var currentState: State {
        get {
            return state
        }
    }
}
```
