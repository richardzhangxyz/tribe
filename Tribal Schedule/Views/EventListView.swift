import SwiftUI

struct EventListView: View {
    @ObservedObject var viewModel: EventViewModel
    
    var body: some View {
        // NavigationView provides a navigation bar and a navigation stack for managing navigation between views.
        NavigationView {
            // Create a list of events from viewModel
            List(viewModel.events) { event in
            // Create a NavigationLink for each event, navigate to an EventDetailView for each event
                NavigationLink(destination: EventDetailView(event: event, viewModel: viewModel)) {
                    EventRowView(event: event)
                }
            }
            .navigationTitle("Discover")
            // Creates a button that navigates to a CreateEventView
            .navigationBarItems(trailing: NavigationLink(destination: CreateEventView(viewModel: viewModel)) {
                Image(systemName: "plus")
            })
        }
    }
}

struct EventRowView: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.name)
                .font(.headline)
            Text(event.location)
                .font(.subheadline)
            Text("\(event.startTime, style: .date) \(event.startTime, style: .time)")
                .font(.caption)
        }
    }
}
