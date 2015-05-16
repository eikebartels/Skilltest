//
//  StatusImageView.swift
//  SkillTest
//
//  Created by Eike Bartels on 16/05/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

import UIKit

internal class StatusImageView: UIImageView {

    var status:CalendarRowStatus = .missed{
        didSet{
            self.image = self.statusImage
        }
    }
    
    private var statusImage:UIImage{
        get{
            var _imageName:String = "missed"
            println(self.status)
            switch self.status{
                case .completed:        _imageName = "completed"; break
                case .completedCurrent: _imageName = "completedCurrent"; break
                default :               _imageName = "missed"; break
            }
            
            return UIImage(named: _imageName)!
        }
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(status:CalendarRowStatus) {
        super.init(frame: CGRectZero)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentMode = UIViewContentMode.Center
        self.status = status // didSet() not called in init
        self.image = self.statusImage
        
    }
    
}
