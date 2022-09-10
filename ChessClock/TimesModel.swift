//
//  TimesModel.swift
//  ChessClock
//
//  Created by Burak Köse on 9.09.2022.
//

import Foundation
import UIKit

struct Time {
    var min: Int
    var plus: Int
}

struct Times {
    var timeArray = [
    
        Time(min: 1, plus: 0),
        Time(min: 2, plus: 1),
        Time(min: 3, plus: 0),
        Time(min: 3, plus: 2),
        Time(min: 5, plus: 0),
        Time(min: 5, plus: 3),
        Time(min: 10, plus: 0),
        Time(min: 10, plus: 5),
        Time(min: 15, plus: 0),
        Time(min: 15, plus: 10),
        Time(min: 30, plus: 0),
        Time(min: 30, plus: 20)
    ]
}


