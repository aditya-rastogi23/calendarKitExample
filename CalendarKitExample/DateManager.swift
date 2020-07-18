
import Foundation
protocol DateManagerDelegate {
	func didUpdateData()
}

class DateManager {
	// MARK: - dates used throughout to maintain which dates have been fetched
	
	var delegate: DateManagerDelegate?
	static var date = Date()
	static var minDate = Date()
	static var maxDate = Date()
	
	
	// MARK: - custom calendar used to maintain timezone and localization
	
	static var customCalendar: Calendar = {
		let customNSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
		customNSCalendar.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation()!)!
		var calendar = customNSCalendar as Calendar
		calendar.locale = .current
		calendar.firstWeekday = 2
		return calendar
	}()
	
	// MARK: - function to make api call and set date
	
	
	func setDate(date: Date, maxDate endDate: Date, minDate startDate: Date) {
		// update current date
		DateManager.date = date
		
		// check if startDate is earlier than already minimum fetched date
		if startDate.isEarlier(than: DateManager.minDate) {
			// print date being fetched
			print("fetching data from \(startDate) to \(DateManager.minDate)")
			EventManager.generateData(dateStart: startDate, dateEnd: DateManager.minDate)
			DateManager.minDate = startDate
		}
		
		// check if endDate is after maximum fetched date
		if endDate.isLater(than: DateManager.maxDate) {
			// print date being fetched
			print("fetching data from \(DateManager.maxDate) to \(endDate))")
			EventManager.generateData(dateStart: DateManager.maxDate, dateEnd: endDate)
			DateManager.maxDate = endDate
		}
		delegate?.didUpdateData()
	}
	
}
