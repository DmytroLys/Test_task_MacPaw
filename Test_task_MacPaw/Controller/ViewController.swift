//
//  ViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate {

    @IBOutlet var tableView: UITableView!
    
    
    var networkManager = NetworkManager()
    var lossesPersonnel = [LossesPersonnelData]()
    var lossesEquipment = [LossesEquipmentData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.delegate = self
        networkManager.performRequest(with: networkManager.urlPersonnel) {
            self.tableView.reloadData()
        }

        networkManager.performRequest(with: networkManager.urlEquipment) {
            self.tableView.reloadData()
        }
        
    }
    
    func getData<T>( _ networkManager : NetworkManager, array: [T])  {
        if array is [LossesPersonnelData] {
            let newArray = array as? [LossesPersonnelData]
            lossesPersonnel = newArray!
//            print(lossesPersonnel)
        } else if array is [LossesEquipmentData] {
            let newArray = array as? [LossesEquipmentData]
            lossesEquipment = newArray!
//            print(lossesEquipment)
        } else {
            return
        }
    }
    
//    func getEqData(_ networkManager: NetworkManager, array: [LossesEquipmentData]) {
//        lossesEquipment = array
//        print(lossesEquipment)
//    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You select cell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lossesPersonnel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = lossesPersonnel[indexPath.row].day.description
        return cell
    }
    
}

