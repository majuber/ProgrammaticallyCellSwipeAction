//
//  SwipeView.swift
//  ProgrammaticallyCellSwipeAction
//
//  Created by Juber Moulvi Abdul on 15/11/17.
//  Copyright © 2017 Juber Moulvi Abdul. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView {

        override init(frame: CGRect) {
            super.init(frame: frame)
            
           // If you are planning to load it programmatically
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            // If you are planning to load it from XIB
        }
}

extension UIView {
    class func swipeViewFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
