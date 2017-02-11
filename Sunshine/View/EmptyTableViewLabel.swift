//
//  EmptyTableViewLabel.swift
//  Sunshine
//
//  Created by Tyler Madonna on 2/11/17.
//  Copyright © 2017 Tyler Madonna. All rights reserved.
//

import UIKit

// View that is set as the UITableView background if the UITableview is empty
class EmptyTableViewLabel: UILabel {
    
    convenience init(message: String, size: CGSize) {
        self.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        self.text = message
        self.textColor = .black
        
        self.numberOfLines = 0;
        self.textAlignment = .center;
        
        self.font = UIFont.systemFont(ofSize: 15)
        
        self.sizeToFit()
        
    }
    
}
