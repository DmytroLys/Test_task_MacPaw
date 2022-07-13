//
//  Manager.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import Foundation
import UIKit

protocol NetworkManagerDelegate {
    func getData(_ networkManager:NetworkManager, array: [LossesPersonnelData])
}

struct NetworkManager {
    
    let urlPersonnel = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    let urlEquipment = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
    
    var delegate : NetworkManagerDelegate?
    
    func performRequest (with urlString: String){
        if let url = URL(string:urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if urlString == urlPersonnel{
                        parseJson(lostPersonnelData: safeData)
                    } else {
                        parseJson(lostEquipmentData: safeData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(lostPersonnelData: Data){
        let decoder = JSONDecoder()
        do {
            
            let correctData = hadndleNanValue(inputData: lostPersonnelData)
            let decodedData = try decoder.decode([LossesPersonnelData].self, from: correctData)
            
//            delegate?.getData(self, array: decodedData)
            
            print(decodedData)
            
            
            
        } catch {
            print(error)
        }
    }
    
    func parseJson(lostEquipmentData: Data) {
        let decoder = JSONDecoder()
        do {
            let correctData = hadndleNanValue(inputData: lostEquipmentData)
            let decodedData = try decoder.decode([LossesEquipmentData].self, from: correctData)
            
            print(decodedData)
            
        } catch {
            print(error)
        }
    }
    
    func hadndleNanValue (inputData:Data) -> Data {
        
        let dataString = String(decoding: inputData, as: UTF8.self)
        let correctString = dataString.replacingOccurrences(of: "NaN", with: "-1")
        let correctData = correctString.data(using: .utf8)!
        
        return correctData
    }
}

