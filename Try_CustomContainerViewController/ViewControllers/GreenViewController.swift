//
//  GreenViewController.swift
//  Try_CustomContainerViewController
//
//  Created by Rudolf Farkas on 22.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    var onReturn : ((String) -> ())?
    var masterDelegate: MasterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(result: "Green cancelled dlg")
        onReturn?("Green cancelled cb")
    }

    @IBAction func doneBUttonPressed(_ sender: Any) {
        masterDelegate?.onReturnFromChildViewController(result: "Green done dlg")
        onReturn?("Green done cb")
    }

}
