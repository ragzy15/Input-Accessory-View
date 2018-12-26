//
//  ViewController.swift
//  InputAccessory
//
//  Created by Raghav Ahuja on 12/26/18.
//  Copyright © 2018 Raghav Ahuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let accessory: InputAccessoryView = .loadNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Allows UIViewController to have inputAccessoryView
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // input View for UIViewController
    override var inputAccessoryView: UIView? {
        return accessory
    }
}

