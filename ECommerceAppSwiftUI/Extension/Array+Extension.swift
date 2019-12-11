//
//  Array+Extension.swift
//  DisplayGrid
//
//  Created by Ayush Gupta on 20/11/19.
//  Copyright © 2019 Ayush Gupta. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
