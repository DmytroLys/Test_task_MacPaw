//
//  Formatter+Extensions.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 20.07.2022.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}
