import UIKit
import CalendarKit
// MARK: - class definitions, DayViewController overrides

class DailyScheduleViewController: DayViewController {
	// MARK: - class variables
	let viewModel=DailyViewModel()
	
	// MARK: - events data source
	override func eventsForDate(_: Date) -> [EventDescriptor] {
		return EventManager.generatedEvents
	}
	
	// MARK: - DayViewDelegate functions. These functions are the main source of interaction with the calendar.
	override func dayView(dayView: DayView, willMoveTo date: Date) {
		//print("DayView = \(dayView) did move to: \(date)")
		viewModel.updateDate(withDate:date)
	}
	
	override func dayViewDidSelectEventView(_ eventView: EventView) {
		guard let event = eventView.descriptor as? Event else {
			return
		}
		print(event.userInfo ?? "")
	}
}

// MARK: - view lifecycle functions

extension DailyScheduleViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.delegate=self
		viewModel.updateDate(withDate: DateManager.date)
		UIInit()
		navigationInit()
		reloadData()
	}
	
}

// MARK: - Init functions

extension DailyScheduleViewController {
	// this function is used to change style,set calendar
	func UIInit() {
		dayView = DayView(calendar: viewModel.calendar)
		dayView.delegate = self
		dayView.dataSource = self
		dayView.autoScrollToFirstEvent = true
		var calendarStyle = CalendarStyle()
		calendarStyle.header.daySelector.todayInactiveTextColor=ColorManager.darkBlue
		calendarStyle.header.daySelector.todayActiveBackgroundColor=ColorManager.darkBlue
		calendarStyle.header.daySelector.selectedBackgroundColor=ColorManager.darkBlue
		calendarStyle.timeline.timeIndicator.color=ColorManager.darkBlue
		calendarStyle.timeline.verticalDiff=100
		calendarStyle.timeline.eventsWillOverlap = true
		dayView.updateStyle(calendarStyle)
		view=dayView
	}
	
	// navigation controller init for title, buttons, style.
	func navigationInit() {
		title = "Calendar"
		navigationController?.navigationBar.isTranslucent = false
	}
}
// MARK: - DateManagerDelegate functions

extension DailyScheduleViewController: DailyViewModelDelegate {
	func updateData() {
		reloadData()
		dayView.scrollToFirstEventIfNeeded()
	}
}

