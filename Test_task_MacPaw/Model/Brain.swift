//
//  Brain.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 22.07.2022.
//

import Foundation

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
}
