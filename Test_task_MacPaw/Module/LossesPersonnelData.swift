//
//  LostsData.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import Foundation
import UIKit


struct LossesPersonnelData: Decodable {
    
    var date: String
    var day: Int
    var personnel: Int
    var POW: Int?
    
}



