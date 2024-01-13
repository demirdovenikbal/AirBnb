//
//  DestinationSearchView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-11.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @State var selectedOption : DestinationSearchOptions = .location
    @State private var destination = ""
    @State private var toDate = Date()
    @State private var fromDate = Date()
    @State private var guests = 2
    @Binding var show : Bool
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                if !destination.isEmpty {
                    Button {
                        destination = ""
                        toDate = Date()
                        fromDate = Date()
                        guests = 2
                    } label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding(.horizontal)
            VStack {
                //location searching
                VStack(alignment: .leading) {
                    if selectedOption == .location {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Search destinations", text: $destination)
                                .font(.headline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }
                    else {
                        CollapsedPickerView(title: "Where", description: "Add destination")
                    }
                }
                .frame(height: selectedOption == .location ? 120 : 50)
                .modifier(CollapsibleDestinationViewModifier())
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedOption = .location
                    }
                }
                
                
                //date selection
                VStack(alignment: .leading) {
                    if selectedOption == .dates {
                        Text("When's your trip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        VStack {
                            DatePicker("From", selection: $fromDate, displayedComponents: .date)
                            Divider()
                            DatePicker("To", selection: $toDate, displayedComponents: .date)
                        }
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    } else {
                        CollapsedPickerView(title: "When", description: "Add dates")
                    }
                }
                .frame(height: selectedOption == .dates ? 120 : 50)
                .modifier(CollapsibleDestinationViewModifier())
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedOption = .dates
                    }
                }
                //number of guests
                VStack(alignment: .leading) {
                    if selectedOption == .guests {
                        Text("Who's coming?")
                            .font(.title)
                            .fontWeight(.semibold)
                        Stepper {
                            Text("\(guests) Adults")
                        } onIncrement: {
                            guests += 1
                        } onDecrement: {
                            guard guests > 1 else { return }
                            guests -= 1
                        }
                        
                    } else {
                        CollapsedPickerView(title: "Who", description: "Add guests")
                    }
                }
                .frame(height: selectedOption == .guests ? 120 : 50)
                .modifier(CollapsibleDestinationViewModifier())
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedOption = .guests
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            
    }
}

struct CollapsedPickerView: View {
    let title : String
    let description : String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
        }
    }
}
