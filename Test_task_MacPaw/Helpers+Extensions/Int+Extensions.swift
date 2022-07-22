//
//  Int+Extensions.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 20.07.2022.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? "hohoho"
    }
} 
