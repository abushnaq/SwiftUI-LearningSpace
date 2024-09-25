//
//  Shared.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/25/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture


enum Screens {
    case showWedge
    case showClock
    case showProgress
    case spinWithDragGesture
    case cutImage
    case tcaDemo
    case dragDrop
}

@ViewBuilder
    func navigate(to screen: Screens) -> some View {
        switch screen {
        case .showWedge:
            ShowWedge()
        case .showClock:
            ShowClock()
        case .spinWithDragGesture:
            SpinWithDragGesture()
        case .showProgress:
            ShowProgress()
        case .cutImage:
            CutImage()
        case .tcaDemo:
            ContactsView(store: Store(initialState: ContactsFeature.State()) {
                ContactsFeature()
              })
        case .dragDrop:
            DragAndDrop()

        }
    }
