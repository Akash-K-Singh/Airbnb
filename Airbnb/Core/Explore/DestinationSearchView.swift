//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Shruti Makwana on 20/03/24.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {

    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack {
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                
            }
            .padding()
            
            // location selection view
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .modifier(CustomVStackModifier())
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .location }
            }
            
            // date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    GeometryReader { geometry in
                        VStack(alignment: .leading) {
                            Text("When's your trip?")
                                .font(.title2)
                                .fontWeight(.semibold)
                            VStack {
                                DatePicker("From", selection: $startDate, displayedComponents: .date)
                                Divider()
                                DatePicker("To", selection: $endDate, displayedComponents: .date)
                            }
                        }
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.white)
                    }
                    
                } else {
                    GeometryReader { geometry in
                        VStack {
                            CollapsedPickerView(title: "When", description: "Add dates")
                        }
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.white)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selectedOption = .dates
                            }
                        }
                    }
                }
            } // Add padding around the VStack
            .frame(height: selectedOption == .dates ? 160 : 64) // Set frame height based on selected option
            .modifier(CustomVStackModifier())

            // num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    GeometryReader { geometry in
                        VStack(alignment: .leading){
                            Text("Who is coming?")
                                .font(.title2)
                                .fontWeight(.semibold)
                            VStack {
                                Stepper {
                                    Text("\(numGuests) Adults")
                                } onIncrement: {
                                    numGuests += 1
                                } onDecrement: {
                                    if numGuests > 0{
                                        numGuests -= 1
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.white)
                    }
                    
                } else {
                    GeometryReader { geometry in
                        VStack {
                            CollapsedPickerView(title: "Who", description: "Add guests")
                        }
                        .padding()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.white)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selectedOption = .guests
                            }
                        }
                    }
                }
            } // Add padding around the VStack
            .frame(height: selectedOption == .guests ? 120 : 64) // Set frame height based on selected option
            .modifier(CustomVStackModifier())
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CustomVStackModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Color.white) // Set background color to white
            .clipShape(RoundedRectangle(cornerRadius: 12)) // Clip shape with rounded rectangle
            .padding() // Additional padding
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

