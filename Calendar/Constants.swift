//
//  Constants.swift
//  SkillTest
//
//  Created by Eike Bartels on 16/05/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

public enum CalendarRowStatus{
    case missed
    case completed
    case completedCurrent
}

public enum CalendarWeekday: Int{
    case Mon = 0
    case Tue
    case Wed
    case Thu
    case Fri
    case Sat
    case Sun

    func description () -> String {
        switch self {
        case .Mon:
            return "Monday"
        case .Tue:
            return "Tuesday"
        case .Wed:
            return "Wednesday"
        case .Thu:
            return "Thursday"
        case .Fri:
            return "Friday"
        case .Sat:
            return "Saturday"
        default: return "Sunday"
        }
    }
    
}
