//
//  UIView+Constraints.swift
//  SkillTest
//
//  Created by Eike Bartels on 16/05/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

extension UIView{
    
    internal func setLeadingConstraint(item:UIView,toItem:UIView){
        var constraint = NSLayoutConstraint(item: item,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 0)
        
        toItem.addConstraint(constraint)
    }
    
    internal func setTrailingConstraint(item:UIView,toItem:UIView){
        var constraint = NSLayoutConstraint(item: item,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 0)
        
        toItem.addConstraint(constraint)
    }

}