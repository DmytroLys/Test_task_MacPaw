//
//  DetailViewController.swift
//  Test_task_MacPaw
//
//  Created by Dmytro on 15.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private var lPersonnelLose: UILabel!
    @IBOutlet private var lChangePersonnelLose: UILabel!
    
    @IBOutlet private var lTankLose: UILabel!
    @IBOutlet private var lAPCLose: UILabel!
    @IBOutlet private var lAircraftLose: UILabel!
    @IBOutlet private var lHelicopterLose: UILabel!
    
    @IBOutlet private var lFieldArtilllery: UILabel!
    @IBOutlet private var lAntiAircraftWarfare: UILabel!
    @IBOutlet private var lCruiseMissiles: UILabel!
    @IBOutlet private var lVehiclesAndFuel: UILabel!
    @IBOutlet private var lMrl: UILabel!
    @IBOutlet private var lDrone: UILabel!
    @IBOutlet private var lNavalShip: UILabel!
    @IBOutlet private var lSpecialEquipment: UILabel!
    
    
    @IBOutlet private var tanksView: UIView!
    @IBOutlet private var bbmView: UIView!
    @IBOutlet private var aircraftView: UIView!
    @IBOutlet private var helicopterView: UIView!
    
    var brain = Brain()
    
    var currentDayPersonnelLose: LossesPersonnelData?
    var currentDayEquipmentLose: LossesEquipmentData?
    var changeLose:String?
    
    private let circleHelper = CircleHelper()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Статистика за \(currentDayPersonnelLose?.day.description ?? "") день війни"
        
        setupUI()
    }
    
    private func setupUI () {
        
        if let Pdata = currentDayPersonnelLose {
            
            lPersonnelLose.text = Pdata.personnel.formattedWithSeparator
        }
        
        if let Edata = currentDayEquipmentLose {
            
            circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: tanksView)
            circleHelper.createCircle(startAngle: 0, endAngle:
                                        brain.percentOfLose(item: currentDayEquipmentLose?.tank, totalAmount: Constant.tanks ), view: tanksView)
            
            circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: bbmView)
            circleHelper.createCircle(startAngle: 0, endAngle:
                                        brain.percentOfLose(item: currentDayEquipmentLose?.apc, totalAmount: Constant.apc), view: bbmView)
            
            circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: aircraftView)
            circleHelper.createCircle(startAngle: 0, endAngle:
                                        brain.percentOfLose(item: currentDayEquipmentLose?.aircraft, totalAmount: Constant.aircrafts), view: aircraftView)
            
            circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: helicopterView)
            circleHelper.createCircle(startAngle: 0, endAngle:
                                        brain.percentOfLose(item: currentDayEquipmentLose?.helicopter, totalAmount: Constant.helicopters), view: helicopterView)
            
            lTankLose.text = Edata.tank.formattedWithSeparator
            lAPCLose.text = Edata.apc.formattedWithSeparator
            lAircraftLose.text = Edata.aircraft.formattedWithSeparator
            lHelicopterLose.text = Edata.helicopter.formattedWithSeparator
            lFieldArtilllery.text = Edata.fieldArtillery.formattedWithSeparator
            lAntiAircraftWarfare.text =  Edata.antiAircraftWarfare.formattedWithSeparator
            lCruiseMissiles.text = Edata.cruiseMissiles?.formattedWithSeparator ?? "-"
            lVehiclesAndFuel.text = {
                if let one = Edata.fuelTank {
                    if let two = Edata.militaryAuto {
                        let sum = one + two
                        return sum.formattedWithSeparator
                    }
                }
                
                return Edata.vehiclesAndFuel?.formattedWithSeparator
            }()
            
            lMrl.text = Edata.mrl.formattedWithSeparator
            lDrone.text = Edata.drone.formattedWithSeparator
            lNavalShip.text = Edata.navalShip?.formattedWithSeparator
            lSpecialEquipment.text = Edata.specialEquipment?.formattedWithSeparator ?? "-"
            lChangePersonnelLose.text = changeLose ?? ""

    }

}


}
