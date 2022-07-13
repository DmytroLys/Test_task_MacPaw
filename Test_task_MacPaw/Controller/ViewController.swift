//
//  ViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate {
    
    
    var networkManager = NetworkManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.delegate = self
        networkManager.performRequest(with: networkManager.urlPersonnel)
        networkManager.performRequest(with: networkManager.urlEquipment)
        
    }
    
    func getData(_ networkManager:NetworkManager, array: [LossesPersonnelData]) {
        
        
    }
    
    
}

