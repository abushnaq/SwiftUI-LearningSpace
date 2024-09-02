//
//  Contact.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/29/24.
//


import Foundation
import ComposableArchitecture
import SwiftUI


struct Contact: Equatable, Identifiable {
  let id: UUID
  var name: String
}


@Reducer
struct ContactsFeature {
  @ObservableState
  struct State: Equatable {
    @Presents var addContact: AddContactFeature.State?
      @Presents var alert: AlertState<Action.Alert>?
    var contacts: IdentifiedArrayOf<Contact> = []
  }
  enum Action {
    case addButtonTapped
    case addContact(PresentationAction<AddContactFeature.Action>)
      case alert(PresentationAction<Alert>)
      case deleteButtonTapped(id: Contact.ID)
      enum Alert: Equatable {
          case confirmDeletion(id: Contact.ID)
          }
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addButtonTapped:
        // TODO: Handle action
          state.addContact = AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "")
                  )
        return .none
//      case .addContact(.presented(.delegate(.cancel))):
//              state.addContact = nil
//              return .none
      case let .addContact(.presented(.delegate(.saveContact(contact)))):
              // guard let contact = state.addContact?.contact
              // else { return .none }
              state.contacts.append(contact)
//              state.addContact = nil
              return .none
      case .addContact(_):
          return .none
      case let .alert(.presented(.confirmDeletion(id: id))):
              state.contacts.remove(id: id)
              return .none
              
            case .alert:
              return .none
      case let .deleteButtonTapped(id: id):
          state.alert = AlertState {
                    TextState("Are you sure?")
                  } actions: {
                    ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                      TextState("Delete")
                    }
                  }
        return .none
      }
    }
    .ifLet(\.$addContact, action: \.addContact) {
          AddContactFeature()
        }
      
    .ifLet(\.$alert, action: \.alert)
  }
}

struct ContactsView: View {
@Bindable var store: StoreOf<ContactsFeature>
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(store.contacts) { contact in
            HStack {
                       Text(contact.name)
                       Spacer()
                       Button {
                         store.send(.deleteButtonTapped(id: contact.id))
                       } label: {
                         Image(systemName: "trash")
                           .foregroundColor(.red)
                       }
                     }
        }
      }
      .navigationTitle("Contacts")
      .toolbar {
        ToolbarItem {
          Button {
            store.send(.addButtonTapped)
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
    .sheet(
          item: $store.scope(state: \.addContact, action: \.addContact)
        ) { addContactStore in
          NavigationStack {
            AddContactView(store: addContactStore)
          }
        }
        .alert($store.scope(state: \.alert, action: \.alert))
  }
}
#Preview {
  ContactsView(
    store: Store(
      initialState: ContactsFeature.State(
        contacts: [
          Contact(id: UUID(), name: "Blob"),
          Contact(id: UUID(), name: "Blob Jr"),
          Contact(id: UUID(), name: "Blob Sr"),
        ]
      )
    ) {
      ContactsFeature()
    }
  )
}

extension ContactsFeature {
  @Reducer
  enum Destination {
      case addContact(AddContactFeature)
          case alert(AlertState<ContactsFeature.Action.Alert>)
  }
}
