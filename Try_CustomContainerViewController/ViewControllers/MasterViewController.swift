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


class MasterViewController: UIViewController, MasterDelegate {

    let stateMachine = StateMachine()

    var activeChildController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private lazy var redViewController: RedViewController = {
        // load storyboard, instantiate controller and return it
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
        return viewController
    }()

    private lazy var greenViewController: GreenViewController = {
        // load storyboard, instantiate controller and return it
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        return viewController
    }()

    private lazy var blueViewController: BlueViewController = {
        // load storyboard, instantiate controller and return it
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        return viewController
    }()

    private func setupView() {
//        redViewController.masterDelegate = self
        redViewController.onReturn = onReturnFromChildViewController
//        greenViewController.masterDelegate = self
        greenViewController.onReturn = onReturnFromChildViewController
//        blueViewController.masterDelegate = self
        blueViewController.onReturn = onReturnFromChildViewController
       updateView()
    }

    func updateView() {
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
        updateView()
    }

    func add(asChildViewController viewController: UIViewController) {
        // add child
        addChildViewController(viewController)
        // add child view as subview
        view.addSubview(viewController.view)
        // configure child view
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // notify child view controller
        viewController.didMove(toParentViewController: self)
    }

    func remove(asChildViewController viewController: UIViewController) {
        // notify child
        viewController.willMove(toParentViewController: nil)
        // remove child view from superview
        viewController.view.removeFromSuperview()
        // notify child view controller
        viewController.removeFromParentViewController()
    }


}

