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
    var personnel:Int
    var POW: Int
}

struct LossesEquipmentData: Decodable {
    
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank, drone
            
            case apc = "APC"
            case fieldArtillery = "field artillery"
            case mrl = "MRL"
            case militaryAuto = "military auto"
            case fuelTank = "fuel tank"
            case antiAircraftWarfare = "anti-aircraft warfare"
            case specialEquipment = "special equipment"
            case mobileSRBM = "mobile SRBM system"
            case vehiclesAndFuel = "vehicles and fuel tanks"
            case cruiseMissiles =  "cruise missiles"
        }
    
    var date :String?
    var day: Int?
    var aircraft : Int?
    var helicopter: Int?
    var tank : Int?
    var drone : Int?
    var apc : Int?
    var fieldArtillery : Int?
    var mrl : Int?
    var militaryAuto : Int?
    var fuelTank : Int?
    var antiAircraftWarfare : Int?
    var specialEquipment : Int?
    var mobileSRBM : Int?
    var vehiclesAndFuel : Int?
    var cruiseMissiles : Int?

    
    

}


