//
//  SunshineTitleView.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/18/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class SunshineTitleView: UIView {
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Clear")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Sunshine"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logo)
        addSubview(title)
        
        let logoSize = frame.height - 8
        
        logo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: logoSize).isActive = true
        logo.widthAnchor.constraint(equalToConstant: logoSize).isActive = true
        logo.leftAnchor.constraint(equalTo: leftAnchor, constant: 33 - logoSize / 2).isActive = true
        
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: logoSize).isActive = true
        title.widthAnchor.constraint(equalToConstant: 150).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 66).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
