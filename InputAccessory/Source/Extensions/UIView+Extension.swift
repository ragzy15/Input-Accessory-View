//
//  UIView+Extension.swift
//  InputAccessory
//
//  Created by Raghav Ahuja on 12/26/18.
//  Copyright © 2018 Raghav Ahuja. All rights reserved.
//

import UIKit

extension UIView {
    class func loadNib<T: UIView>(owner: Any? = nil) -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: owner, options: nil)?.first as! T
    }
}
