//
//  EventManager.swift
//  CalendarKitExample
//
//  Created by Aditya Rastogi on 15/07/20.
//  Copyright © 2020 Aditya Rastogi. All rights reserved.
//

import Foundation
import CalendarKit
class EventManager
{
	static var generatedEvents=[Event]()
	static func generateData(dateStart:Date,dateEnd:Date)
	{
		var date=dateStart
		while date.isEarlierThanOrEqual(to: dateEnd) {
			let timeIntervalHour=TimeInterval(3600)
			let eventOuter=Event()
			eventOuter.text="work"
			eventOuter.backgroundColor=#colorLiteral(red: 0.2474943436, green: 0.7465668981, blue: 0.9556630711, alpha: 0.7581335616)
			let eventInner=Event()
			eventInner.text="the type of work"
			eventInner.backgroundColor=#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.724020762)
			eventOuter.startDate=date
			eventOuter.endDate=date.addingTimeInterval(2*timeIntervalHour)
			eventInner.startDate=eventOuter.startDate.addingTimeInterval(timeIntervalHour*0.25)
			eventInner.endDate=eventInner.startDate.addingTimeInterval(0.5*timeIntervalHour)
			generatedEvents.append(eventInner)
			generatedEvents.append(eventOuter)
			date.day(date.day+1)
		}
	}
}
