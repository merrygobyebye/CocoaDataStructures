//
//  Protocols.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 12/29/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import Foundation

protocol Copying {
    func makeCopy() -> Self
}

extension Copying where Self: NSCopying {
    
    func makeCopy() -> Self {
        return self.copy(with: nil) as! Self
    }
}
