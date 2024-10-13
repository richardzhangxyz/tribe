import SwiftUI

// This struct conforms to the View protocol; it is a SwiftUI view
struct CreateEventView: View {

    //ObservedObject = watch this object for changes and update the view when it changes
    // Need this to save the event data and communicate with other parts of your app
    @ObservedObject var viewModel: EventViewModel
    
    //Environment = used to read values from SwiftUI's environment
    //\. = refer to presentation mode of this view without accessing it
    // need this to dismiss hte view programmatically
    @Environment(\.presentationMode) var presentationMode
    
    // Declare private state variables with defualt values
    @State private var name = ""
    @State private var startTime = Date()
    @State private var endTime = Date().addingTimeInterval(3600)
    @State private var location = ""
    @State private var description = ""
    @State private var isPublic = true
    @State private var capacity = 10
    
    // Defines the body property as required by the View protocol
    var body: some View {
        // Navigational bar
        NavigationView {
            // Scrollable list of controls
            Form {
                Section(header: Text("Event Details")) {
                    // Text input field where "$" creates a two-way binding to the name state variable
                    TextField("Event Name", text: $name)
                    
                    DatePicker("Start Time", selection: $startTime, displayedComponents: [.date, .hourAndMinute])
                    DatePicker("End Time", selection: $endTime, displayedComponents: [.date, .hourAndMinute])
                    
                    TextField("Location", text: $location)
                    
                    TextEditor(text: $description)
                        .frame(height: 100)
                }
                
                Section(header: Text("Settings")) {
                    Toggle("Public Event", isOn: $isPublic)
                    Stepper("Capacity: \(capacity)", value: $capacity, in: 1...1000)
                }
                
                Button("Create Event") {
                    let newEvent = Event(name: name, startTime: startTime, endTime: endTime, location: location, description: description, isPublic: isPublic, capacity: capacity, host: "Current User")
                    // When a new Event object is created, it is added to the view model and dismisses the current view
                    viewModel.addEvent(newEvent)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Create Event")
        }
    }
}
