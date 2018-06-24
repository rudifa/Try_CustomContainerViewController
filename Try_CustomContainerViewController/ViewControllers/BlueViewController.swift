//
//  BlueViewController.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    var masterDelegate: MasterDelegate?
    var onReturn : CallbackFunc?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(event: .cancel, result: "Blue cancelled dlg")
        onReturn?(.cancel, "Blue cancelled cb")
    }

    @IBAction func doneBUttonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(event: .done, result: "Blue done dlg")
        onReturn?(.done, "Blue done cb")
    }

}
