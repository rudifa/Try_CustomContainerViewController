//
//  ViewController.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

protocol MasterDelegate: class {
    func onReturnFromChildViewController(event: Event, result: String)
}

typealias CallbackFunc = (Event, String) -> ()

func instantiateFromStoryboard<T: UIViewController>() -> T {
    // load storyboard, instantiate controller and return it
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let className = String(describing: T.self)
    guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? T else {
        fatalError("Could not instantiate a view controller with name: \(className)")
    }
    return viewController
}


class MasterViewController: UIViewController, MasterDelegate {

    var stateMachine = StateMachine1()

    var activeChildController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildViewControllers()
        updateChildViewControllers()
    }

    private lazy var redViewController: RedViewController = instantiateFromStoryboard()
    private lazy var greenViewController: GreenViewController = instantiateFromStoryboard()
    private lazy var blueViewController: BlueViewController = instantiateFromStoryboard()

    private func setupChildViewControllers() {
//        redViewController.masterDelegate = self
//        greenViewController.masterDelegate = self
//        blueViewController.masterDelegate = self
        redViewController.onReturn = onReturnFromChildViewController
        greenViewController.onReturn = onReturnFromChildViewController
        blueViewController.onReturn = onReturnFromChildViewController
    }

    func updateChildViewControllers() {
        if activeChildController != nil {
            remove(asChildViewController: activeChildController!)
        }
        switch (stateMachine.currentState) {
        case .red: activeChildController = redViewController
        case .green: activeChildController = greenViewController
        case .blue: activeChildController = blueViewController
        }
        add(asChildViewController: activeChildController!)
    }

    func onReturnFromChildViewController(event: Event, result: String) {
        print("onReturnFromChildViewController:", result)

        _ = stateMachine.nextState(event: event)
        updateChildViewControllers()
    }

    func add(asChildViewController viewController: UIViewController) {
        // add child
        addChild(viewController)
        // add child view as subview and configure it
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // notify child view controller
        viewController.didMove(toParent: self)
    }

    func remove(asChildViewController viewController: UIViewController) {
        // notify child
        viewController.willMove(toParent: nil)
        // remove child view from superview
        viewController.view.removeFromSuperview()
        // notify child view controller
        viewController.removeFromParent()
    }


}

