//
//  Row.swift
//  SkillTest
//
//  Created by Eike Bartels on 15/05/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

import UIKit

internal class CalendarRow: UIView {

    // MARK: - Properties
    
    private var index:Int = 0
    
    internal var status:CalendarRowStatus = .missed{
        didSet{
            self.statusImageView.status = status
        }
    }
    
    // MARK: - UIElements
    
    private lazy var statusImageView:StatusImageView = StatusImageView(status: self.status)
    
    private lazy var label:UILabel = {
        var lb = UILabel()
        lb.setTranslatesAutoresizingMaskIntoConstraints(false)
        lb.textAlignment = .Center
        lb.textColor = .lightGrayColor()
        lb.font = UIFont.systemFontOfSize(13)
        lb.minimumScaleFactor = 0.5
        return lb
        }()
    

    // MARK: - Inits
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(index:Int, title:String) {
        super.init(frame: CGRectZero)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.index = index
        self.setHeightConstraint(self, constant: 65)
        
        self.label.text = title.uppercaseString
        self.addSubview(self.label)
        self.setConstrainsForLabel(self.label)
        
        self.addSubview(self.statusImageView)
        self.setConstrainsForStatusImageView(self.statusImageView)
    }
    

    
    // MARK: - Constraints
    
    
    private func setHeightConstraint(item:UIView, constant:CGFloat){
        var constH = NSLayoutConstraint(item: item,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: constant)
        self.addConstraint(constH)
    }
    
    private func setToBottomConstraint(item:UIView,toItem:UIView,toItemAttribute:NSLayoutAttribute = .Bottom){
        var constraint = NSLayoutConstraint(item: item,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: toItem,
            attribute: toItemAttribute,
            multiplier: 1.0,
            constant: 0)
        
        self.addConstraint(constraint)
    }
    
    private func setConstrainsForLabel(label:UILabel){
        self.setHeightConstraint(label, constant: 25)
        self.setLeadingConstraint(label, toItem: self)
        self.setTrailingConstraint(label, toItem: self)
        self.setToBottomConstraint(label, toItem: self)
    }
    
    private func setConstrainsForStatusImageView(imageView:StatusImageView){
        self.setHeightConstraint(imageView, constant: 40)
        self.setLeadingConstraint(imageView, toItem: self)
        self.setTrailingConstraint(imageView, toItem: self)
        self.setToBottomConstraint(imageView, toItem: self.label, toItemAttribute: .Top)
    }
}
