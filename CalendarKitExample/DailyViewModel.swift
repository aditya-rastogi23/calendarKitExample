

import Foundation
import UIKit
//MARK: - protocol for DailyViewDelegate
protocol DailyViewModelDelegate{
	func updateData()
}

//MARK: - Class variables and init
class DailyViewModel{
	
	//delegate which is notified on data changes
	var delegate:DailyViewModelDelegate?
	//calendar referencing customCalendar in DateManager
	var calendar=DateManager.customCalendar
	// instance of DateManager to set Date
	var manager = DateManager()
	// the custom filter view designed
	
	init() {
		manager.delegate=self
	}
}


//MARK: - class date updation
extension DailyViewModel{

	func updateDate(withDate date:Date){
		let lastMonthDay=date.getLastOfMonth()
		let firstMonthDay=date.getFirstOfMonth()
		manager.setDate(date: date, maxDate: lastMonthDay, minDate: firstMonthDay)
	}
}

//MARK: - date manager delegate
extension DailyViewModel:DateManagerDelegate{
	func didUpdateData() {
		delegate?.updateData()
	}
}
