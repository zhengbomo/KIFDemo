//
//  KIFUITestActor+System.swift
//  KIFTest
//
//  Created by bomo on 2017/3/4.
//  Copyright © 2017年 bomo. All rights reserved.
//

import KIF

extension KIFUITestActor {
    
    /// handle多个system alert
    func handleSystemAlert() -> Bool {
        var count = 0
        while acknowledgeSystemAlert() {
            count += 1
        }
        return count > 0
    }
    
    
}
