//
//  ViewController.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

                setupView()
    }

//    @IBOutlet weak var segmentedControl: UISegmentedControl!

    private lazy var redViewController: RedViewController = {
        // load storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // instantiate
        var viewController = storyboard.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
        // add as child view controller
        self.add(asChildViewController: viewController)

        return viewController
    }()

//    private lazy var sessionsViewController: SessionsViewController = {
//        // load storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        // instantiate
//        var viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController
//        // add as child view controller
//        self.add(asChildViewController: viewController)
//
//        return viewController
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupView()
//    }

    private func setupView() {
//        setupSegmentedControl()
        updateView()
    }

//    private func setupSegmentedControl() {
//        // configure
//        segmentedControl.removeAllSegments()
//        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
//        segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
//        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
//        // select
//        segmentedControl.selectedSegmentIndex = 0
//    }
//
//    @objc func selectionDidChange(_ sender: UISegmentedControl) {
//        updateView()
//    }
//
    func updateView() {
//        if segmentedControl.selectedSegmentIndex == 0 {
//            remove(asChildViewController: sessionsViewController)
            add(asChildViewController: redViewController)
//        } else {
//            remove(asChildViewController: summaryViewController)
//            add(asChildViewController: sessionsViewController)
//        }
    }

    private func add(asChildViewController viewController: UIViewController) {
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

    private func remove(asChildViewController viewController: UIViewController) {
        // notify child
        viewController.willMove(toParentViewController: nil)
        // remove child view from superview
        viewController.view.removeFromSuperview()
        // notify child view controller
        viewController.removeFromParentViewController()
    }


}

