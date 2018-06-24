//
//  RedViewController.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    var masterDelegate: MasterDelegate?
    var onReturn : CallbackFunc?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(event: .cancel, result: "Red cancelled dlg")
        onReturn?(.cancel, "Red cancelled cb")
    }

    @IBAction func doneBUttonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(event: .done, result: "Red done dlg")
        onReturn?(.done, "Red done cb")
    }

}
