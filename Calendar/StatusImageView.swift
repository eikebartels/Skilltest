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
        // disable in iphone simulator to avoid crash for Interface Live Preview
        #if !(TARGET_INTERFACE_BUILDER)
            self.image = self.statusImage
        #endif
    }
}