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

    // MARK: - Properties
    
    private var rows:[CalendarRow] = []
    
// don't use init with coder because otherwiese the canvas preview is not working
//    required public init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    

    override public func didMoveToSuperview() {
        
        var previewView:CalendarRow?
        var weekdays = self.weekdays()
        
        for (var i = 0; i < weekdays.count; i++){
            var row:CalendarRow = CalendarRow(index: i, title:weekdays[i])
            self.rows.append(row)
            self.addSubview(row)
            
            if let previewView = previewView{
                self.setEqualWidthAndLeading(row, leftRow: previewView)
            }else{
                self.setLeadingConstraint(row, toItem: self)
            }
            
            if i + 1 == weekdays.count{
                self.setTrailingConstraint(row, toItem: self)
            }
            
            self.centerInSuperview(row)
            
            previewView = row
        }

    }
    
    /**
     Set status for weekday
    :param: status:CalendarRowStatus, weekday:CalendarWeekday
    */
    
    public func statusForWeekday(status:CalendarRowStatus, weekday:CalendarWeekday){
        var row:CalendarRow = rows[weekday.rawValue]
        row.status = status
    }

    /**
    Returns CalendarRowStatus for given weekday:CalendarWeekday
    :param: status:CalendarRowStatus, weekday:CalendarWeekday
    :returns: CalendarRowStatus
    */
    public func statusForWeekday(weekday:CalendarWeekday) -> CalendarRowStatus{
        var row:CalendarRow = rows[weekday.rawValue]
        return row.status
    }
    
    // MARK: - Private function
    
    private func weekdays() -> [String]{
        // get Weekdays name
        let fmt = NSDateFormatter()
        var days:[String] = fmt.shortWeekdaySymbols as! [String]
        println(days)
        // replace current weekday with today
        fmt.dateFormat = "EE"
        var currentDay = fmt.stringFromDate(NSDate())
        for (var i = 0; i < days.count; i++){
            if(days[i] == currentDay){
                days[i] = "today"
                break
            }
        }
        
        // correct first day of the week
        let firstDay = days.first
        days.removeAtIndex(0)
        days.append(firstDay!)


        return days
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
