//
//  BlueViewController.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    var onReturn : ((String) -> ())?
    var masterDelegate: MasterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(result: "Blue cancelled dlg")
        onReturn?("Blue cancelled cb")
    }

    @IBAction func doneBUttonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(result: "Blue done dlg")
        onReturn?("Blue done cb")
    }

}
