//
//  CalendarIntegration.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/26/24.
//

import SwiftUI
import EventKit
import EventKitUI

struct CalendarIntegration: View {
    let threeHoursInSeconds = 3.0 * 60.0 * 60.0
    let eventStore = EKEventStore()
    
    func generateEvent() -> EKEvent
    {
        let event = EKEvent(eventStore: eventStore)
        
        event.startDate = Date()
        event.calendar = eventStore.defaultCalendarForNewEvents
        event.endDate = Date(timeIntervalSinceNow: threeHoursInSeconds)
        event.title = "Hang out at the park"
        event.availability = .unavailable
        let structuredLocation = EKStructuredLocation(title: "The park")
        structuredLocation.geoLocation = CLLocation(latitude: 42.5, longitude: -71.2)
        event.structuredLocation = structuredLocation
        
        return event
    }
    @State var showResultAlert : Bool = false
    
    @State var showEventKitUIController : Bool = false
    @State private var selectedEvent: EKEvent?
    func addEventViaEventKitUI()
    {
        selectedEvent = generateEvent()
        showEventKitUIController = true
      
    }
    
    func addEventDirectly() async
    {
        let event = generateEvent()
        do
        {
            let accessGranted = try await eventStore.requestFullAccessToEvents()
            if accessGranted
            {
                try self.eventStore.save(event, span: .futureEvents)
                showResultAlert = true
            }
            
        } catch
        {
            print(error)
        }
        
    }
    
    var body: some View {
        VStack {
            Button("Add sample event directly") {
                Task
                {
                    await addEventDirectly()
                }
            }
            .alert("Success!", isPresented: $showResultAlert)
            {
                Button("OK", role: .cancel) { }
            }
            
            Button("Add sample event via EventKit UI") {
                addEventViaEventKitUI()
            }
            
            .alert("Success!", isPresented: $showResultAlert)
            {
                Button("OK", role: .cancel) { }
                
            }
        }.sheet(isPresented: $showEventKitUIController) {
            NavigationView()
            {
                EventKitUIController(event: $selectedEvent, eventStore: eventStore)
            }
        }
    }
}

#Preview {
    CalendarIntegration()
}
