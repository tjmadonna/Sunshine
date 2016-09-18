//
//  GCDHelper.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import Foundation

func performOnMainQueue(updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
