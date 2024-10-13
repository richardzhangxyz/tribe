import SwiftUI

@main
struct Tribal_ScheduleApp: App {
    @StateObject private var eventViewModel = EventViewModel()
    
    var body: some Scene {
        WindowGroup {
            EventListView(viewModel: eventViewModel)
        }
    }
}