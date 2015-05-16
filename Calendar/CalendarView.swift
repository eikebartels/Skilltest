//
//  CalendarView.swift
//  SkillTest
//
//  Created by Eike Bartels on 15/05/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

import UIKit

@IBDesignable
public class CalendarView: UIView {

    let numberOfDays = 7
    var rows:[CalendarRow] = []
    
// don't use init with coder because otherwiese the canvas preview is not working
//    required public init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    override public func didMoveToSuperview() {
    
        var previewView:CalendarRow?

        for (var i = 0; i < numberOfDays; i++){
            var row:CalendarRow = CalendarRow(index: i, title:"bla")
            self.addSubview(row)
            
            if let previewView = previewView{
                self.setEqualWidthAndLeading(row, leftRow: previewView)
            }else{
                self.setLeadingConstraint(row, toItem: self)
            }
            
            if i + 1 == numberOfDays{
                self.setTrailingConstraint(row, toItem: self)
            }
            
            self.centerInSuperview(row)
            
            previewView = row
        }

    }
    
    // MARK: - Constraints
    
    private func centerInSuperview(row:CalendarRow){
        var constraint = NSLayoutConstraint(item: row,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0)
        
        self.addConstraint(constraint)
    }
    
    private func setEqualWidthAndLeading(row:CalendarRow, leftRow:CalendarRow){
        var constraint = NSLayoutConstraint(item: row,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: leftRow,
                attribute: .Width,
                multiplier: 1,
                constant: 0)
        self.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: row,
                attribute: .Leading,
                relatedBy: .Equal,
                toItem: leftRow,
                attribute: .Trailing,
                multiplier: 1.0,
                constant: 0)
        
        self.addConstraint(constraint)
        
    }

}
