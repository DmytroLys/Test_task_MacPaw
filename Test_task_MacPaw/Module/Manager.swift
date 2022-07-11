//
//  Manager.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import Foundation
import UIKit

struct NetworkManager {
    
    let urlPersonnel = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    let urlEquipment = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
    
    func performRequest (urlString: String){
        if let url = URL(string:urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJson(lostPersonnelData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJson(lostPersonnelData:Data){
        let decoder = JSONDecoder()
        do {
            let decodedData: [LossesEquipmentData] = try decoder.decode([LossesEquipmentData].self, from: lostPersonnelData)
            print(decodedData)
        } catch {
            print(error)
        }
    }
}
