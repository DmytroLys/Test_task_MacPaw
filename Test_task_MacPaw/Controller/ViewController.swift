//
//  ViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 11.07.2022.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var brain = Brain()
    
    
    var networkManager = NetworkManager()
    var lossesPersonnel = [LossesPersonnelData]()
    {
        didSet{
            lossesPersonnel.reverse()
        }
    }
    var lossesEquipment = [LossesEquipmentData]() {
        didSet{
            lossesEquipment.reverse()
        }
    }
    
    var currentRowPlData : LossesPersonnelData?
    var changeLose: String?
    var currentRowElData: LossesEquipmentData?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.delegate = self
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentRowPlData = lossesPersonnel[indexPath.row]
        currentRowElData = lossesEquipment[indexPath.row]
        if indexPath.row < lossesPersonnel.count-1 {
            changeLose = brain.previousDay(currentDayStruct: currentRowPlData, previousDayStruct: lossesPersonnel[indexPath.row+1])
        } else {
            changeLose = ""
        }
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lossesPersonnel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            let currentData = lossesPersonnel[indexPath.row]
            cell.numberOfDayLabel.text = "????????: \(currentData.day.description)"
            cell.lossPersonelLabel.text = "~ \(currentData.personnel) ?????????????????? ??????????????"
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
            destinationVC.changeLose = changeLose
            
        }
    }
    
}

