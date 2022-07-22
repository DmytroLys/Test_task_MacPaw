//
//  Brain.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 22.07.2022.
//

import Foundation
import UIKit

class Brain {
    
    func previousDay ( currentDayStruct: LossesPersonnelData?, previousDayStruct:LossesPersonnelData?) -> String {
        if previousDayStruct != nil {
            if currentDayStruct != nil {
                let minus = (currentDayStruct!.personnel) - (previousDayStruct?.personnel)!
                if minus > 0 {
                    return "+\(minus.formattedWithSeparator)"
                }
            }
        }
        return ""
    }
    
    func percentOfLose (item: Int?, totalAmount:Int) -> CGFloat {
        let endAngle: Double = 630
        if let newItem = item {
            let doubleNewItem = Double(newItem)
            let doubleTotalAmount = Double(totalAmount)
            var divided = doubleNewItem/doubleTotalAmount
            divided = divided * endAngle

            return CGFloat(divided)
        }
        return CGFloat(0)
    }
}

struct Constant {
    //The amount of vehicles intended for the invasion the Military Balance handbook
    static let tanks = 1200
    static let aircrafts = 330
    static let helicopters = 240
    static let apc = 2900
    
}
