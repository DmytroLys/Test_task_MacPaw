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
    
    @IBOutlet private var tanksView: UIView!
    @IBOutlet private var bbmView: UIView!
    @IBOutlet private var aircraftView: UIView!
    @IBOutlet private var helicopterView: UIView!
    
    var currentDayPersonnelLose: LossesPersonnelData?
    var currentDayEquipmentLose: LossesEquipmentData?
    
    private let circleHelper = CircleHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Статистика за 97 день війни"
        
        setupUI()
        
    }
    
    private func setupUI () {
        circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: tanksView)
        circleHelper.createCircle(startAngle: 270, endAngle: 630, view: tanksView)

        circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: bbmView)
        circleHelper.createCircle(startAngle: 270, endAngle: 630, view: bbmView)

        circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: aircraftView)
        circleHelper.createCircle(startAngle: 270, endAngle: 630, view: aircraftView)

        circleHelper.createInnerCircle(startAngle: 0, endAngle: 360, view: helicopterView)
        circleHelper.createCircle(startAngle: 270, endAngle: 630, view: helicopterView)
        
        if let Pdata = currentDayPersonnelLose {
            lPersonnelLose.text = "\(Pdata.personnel)"
        }
        
        if let Edata = currentDayEquipmentLose {
            lTankLose.text = "\(Edata.tank)"
            lAPCLose.text = "\(Edata.apc)"
            lAircraftLose.text = "\(Edata.aircraft)"
            lHelicopterLose.text = "\(Edata.helicopter)"
        }
        
        
        
    }
    
    
    
}

