//
//  DateExtension.swift
//  CalendarKitExample
//
//  Created by Aditya Rastogi on 15/07/20.
//  Copyright © 2020 Aditya Rastogi. All rights reserved.
//

import Foundation
extension Date{
	func getLastOfMonth()->Date{
		var date=Date()
		date.day(self.daysInMonth)
		return date
	}
	
	func getFirstOfMonth()->Date{
		var date=Date()
		date.day(1)
		return date
	}
}
