//
//  EventKitUIController.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/26/24.
//

import SwiftUI
import EventKitUI

class EventKitDelegate : NSObject, EKEventEditViewDelegate
{
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.presentingViewController?.dismiss(animated: true)
    }
    
}

struct EventKitUIController: UIViewControllerRepresentable {
    let delegate = EventKitDelegate()
    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = EKEventEditViewController
    
    @Binding var event: EKEvent?
    let eventStore: EKEventStore
    
    /// Create an event edit view controller, then configure it with the specified event and event store.
    func makeUIViewController(context: Context) -> EKEventEditViewController {
        let controller = EKEventEditViewController()
        controller.event = event
        
        controller.editViewDelegate = delegate
        
        return controller
    }
  
}
