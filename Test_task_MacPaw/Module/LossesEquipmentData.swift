//
//  LossesEquipmentData.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 13.07.2022.
//

import Foundation

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
    
    enum StringOrInt: Decodable, CustomStringConvertible {
        
        var description: String {
            switch self {
            case .string(let string):
                return string
            case .int(let int):
                return String(int)
            }
        }
        
        case string(String)
        case int(Int)
        
        init(from decoder: Decoder) throws {
            if let int = try?
                decoder.singleValueContainer().decode(Int.self) {
                self = .int(int)
                return
            }
            if let string = try?
                decoder.singleValueContainer().decode(String.self) {
                self = .string(string)
                return
            }
            
            throw Error.couldNotFindStringOrDouble
        }
        
        enum Error: Swift.Error {
            case couldNotFindStringOrDouble
        }
    }
    
    var date :String
    var day: StringOrInt
    var aircraft : Int
    var helicopter: Int
    var tank : Int
    var drone : Int
    var apc : Int
    var fieldArtillery : Int
    var mrl : Int
    var militaryAuto : Int
    var fuelTank : Int
    var antiAircraftWarfare : Int
    var specialEquipment : Int?
    var mobileSRBM : Int?
    var vehiclesAndFuel : Int?
    var cruiseMissiles : Int?
}
