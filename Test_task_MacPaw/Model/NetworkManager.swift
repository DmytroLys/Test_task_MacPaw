//
//  Manager.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import Foundation

protocol NetworkManagerDelegate {
    func getData<T>(_ networkManager:NetworkManager, array: [T])
}

struct NetworkManager {
    
    let urlPersonnel = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    let urlEquipment = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
    
    var delegate : NetworkManagerDelegate?
    
    func performRequest (with urlString: String, completed: @escaping ()-> ()){
        if let url = URL(string:urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if urlString == urlPersonnel{
                        if let pLoss =  parseJson(lossPersonnelData: safeData) {
                            delegate?.getData(self, array: pLoss)
                            DispatchQueue.main.async {
                                completed()
                            }
                        }
                    } else {
                        if let eqLoss =  parseJson(lossEquipmentData: safeData) {
                            delegate?.getData(self, array: eqLoss)
                            DispatchQueue.main.async {
                                completed()
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(lossPersonnelData: Data) -> [LossesPersonnelData]?{
        let decoder = JSONDecoder()
        do {
            
//            let correctData = hadndleNanValue(inputData: lossPersonnelData)
            let decodedData = try decoder.decode([LossesPersonnelData].self, from: lossPersonnelData)
            
            return decodedData
            
        } catch {
            print(error)
            return nil
        }
    }
    
    func parseJson(lossEquipmentData: Data) -> [LossesEquipmentData]? {
        let decoder = JSONDecoder()
        do {
//            let correctData = hadndleNanValue(inputData: lossEquipmentData)
            let decodedData = try decoder.decode([LossesEquipmentData].self, from: lossEquipmentData)
            
            return decodedData
            
        } catch {
            print(error)
            return nil
        }
    }
    
//    func hadndleNanValue (inputData:Data) -> Data {
//
//        let dataString = String(decoding: inputData, as: UTF8.self)
//        let correctString = dataString.replacingOccurrences(of: "NaN", with: "-1")
//        let correctData = correctString.data(using: .utf8)!
//
//        return correctData
//    }
}

