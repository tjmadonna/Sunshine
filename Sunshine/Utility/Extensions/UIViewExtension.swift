//
//  UIViewExtension.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/14/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
