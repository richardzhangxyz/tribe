import SwiftUI // In SwiftUI, all user interface components are views

struct EventDetailView: View {
    let event: Event // event is a type immutable of type Event
    @ObservedObject var viewModel: EventViewModel
    @State private var isShowingSignUpSheet = false // Control whether the sign-up sheet is currently being displayed or not.
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(event.name)
                    .font(.largeTitle)
                    .bold()
                
                Text(event.location)
                    .font(.title3)
                
                Text("\(event.startTime, style: .date) \(event.startTime, style: .time) - \(event.endTime, style: .time)")
                    .font(.subheadline)
                
                Text(event.description)
                    .font(.body)
                
                Text("Host: \(event.host)")
                    .font(.subheadline)
                
                Text("Capacity: \(event.attendees.count)/\(event.capacity)")
                    .font(.subheadline)
                
                Button("Register for Meal") {
                    isShowingSignUpSheet = true
                }
                .buttonStyle(.borderedProminent)
                .disabled(event.attendees.count >= event.capacity)
            }
            .padding()
        }
        .navigationTitle("Event Details")
        // Display the sheet with is $isShowingSignUpSheet
        .sheet(isPresented: $isShowingSignUpSheet) {
            SignUpSheetView(event: event, viewModel: viewModel)
        }
    }
}

struct SignUpSheetView: View {
    let event: Event
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var company = ""
    @State private var jobTitle = ""
    @State private var linkedin = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Company", text: $company)
                    TextField("Job Title", text: $jobTitle)
                    TextField("LinkedIn Profile", text: $linkedin)
                }
                
                Button("Register") {
                    // In a real app, you'd want to create a User model and pass the actual user ID
                    viewModel.joinEvent(eventId: event.id, userId: name)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Sign Up for Event")
        }
    }
}
