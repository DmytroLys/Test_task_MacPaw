//
//  ViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.performRequest(urlString: networkManager.urlEquipment)
    }


}

