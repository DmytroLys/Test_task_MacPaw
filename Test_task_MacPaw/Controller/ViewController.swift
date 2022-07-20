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
    
    var currentRowPlData : LossesPersonnelData?
    var currentRowElData: LossesEquipmentData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.delegate = self
        self.registerTableViewCells()
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
        } else if array is [LossesEquipmentData] {
            let newArray = array as? [LossesEquipmentData]
            lossesEquipment = newArray!
        } else {
            return
        }
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell",
                                  bundle: nil)
        self.tableView.register(textFieldCell,
                                forCellReuseIdentifier: "CustomTableViewCell")
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRowPlData = lossesPersonnel[indexPath.row]
        currentRowElData = lossesEquipment[indexPath.row]
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lossesPersonnel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            let currentData = lossesPersonnel[indexPath.row]
            cell.numberOfDayLabel.text = "Day: \(currentData.day.description)"
            cell.lossPersonelLabel.text = "~ \(currentData.personnel) invaders destroyed"
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.currentDayPersonnelLose = currentRowPlData
            destinationVC.currentDayEquipmentLose = currentRowElData
            
        }
    }
    
}

