// Import fundamental data types, collections, and utilities
import Foundation

// Defines a new structure (create complex data types by combining simple ones)
// The identifiable protocol creates a unique identiifer (each event has a unique identity)
struct Event: Identifiable {
    let id: UUID // UUID = universally unique identifier / let = declares immutable constant
    var name: String
    var startTime: Date
    var endTime: Date
    var location: String
    var description: String
    var isPublic: Bool
    var capacity: Int
    var host: String
    var attendees: [String]
    
    // Default values are provided for UUID and string (new UUID and empty list)
    init(id: UUID = UUID(), name: String, startTime: Date, endTime: Date, location: String, description: String, isPublic: Bool, capacity: Int, host: String, attendees: [String] = []) {
        self.id = id
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.description = description
        self.isPublic = isPublic
        self.capacity = capacity
        self.host = host
        self.attendees = attendees
    }
}
