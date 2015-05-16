//
//  ViewController.swift
//  SkillTest
//
//  Created by Eike Bartels on 15/05/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

import UIKit
import Calendar

class ViewController: UIViewController {

    @IBOutlet weak var calendar: CalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.calendar.statusForWeekday(.completedCurrent, weekday: .Sat)
        self.calendar.statusForWeekday(.completed, weekday: .Wed)
        self.calendar.statusForWeekday(.Sat)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

