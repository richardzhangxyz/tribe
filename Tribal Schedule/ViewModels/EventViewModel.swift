import Foundation

// ObservableObject protocol in Swift enables data binding between app data and UI
// Views will automatically update whenever the underlying data changes
class EventViewModel: ObservableObject {
    
    // Published property events which is an array of Event objects
    @Published var events: [Event] = []
    
    func addEvent(_ event: Event) {
        events.append(event)
    }
    
    // Takes a parameter id of type UUID and returns an optional Event
    func getEvent(withId id: UUID) -> Event? {
        // Returns the first element that satisfies the given condition
        // $0 refers to each Event in the array and if its id matches the id we are looking for
        events.first(where: { $0.id == id })
    }
    
    func joinEvent(eventId: UUID, userId: String) {
        // First tries to find the index of the event in the events array and returns the index
        if let index = events.firstIndex(where: { $0.id == eventId }) {
            // If an even with the matching ID is found, we enter the if let block
            // Access the event at the found index and append the userID to its attendees array
            events[index].attendees.append(userId)
        }
    }
}