//
//  ViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate {
    
    var networkManager = NetworkManager()
    var lossesPersonnel = [LossesPersonnelData]()
    var lossesEquipment = [LossesEquipmentData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.delegate = self
        networkManager.performRequest(with: networkManager.urlPersonnel) {
            print("Done")
        }
        print(lossesPersonnel)
        networkManager.performRequest(with: networkManager.urlEquipment) {
            print("Done")
        }
        
    }
    
    func getData(_ networkManager:NetworkManager, array: [LossesPersonnelData]) {
        lossesPersonnel = array
    }
    
    
}

