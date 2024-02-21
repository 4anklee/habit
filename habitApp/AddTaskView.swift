//
//  AddTaskView.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/3/17.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var Title = ""
    @State private var Location = ""
    @State private var isAllDay = false
    @State private var startsDate = Date()
    @State private var endsDate = Date()
    @State private var Repeat = "Never"
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        NavigationStack{
            
            Form {
                Section(header: Text("Task")){
                    LabeledContent("Title"){
                        TextField("Title", text: $Title)
                    }
                    LabeledContent("Location"){
                        TextField("Location or URL", text: $Location)
                    }
                }
                
                Section(header: Text("Duration")){
                    Toggle("All day", isOn: $isAllDay)
                        .toggleStyle(SwitchToggleStyle(tint: mint_meadow))
                    DatePicker("Starts", selection: $startsDate, displayedComponents: [.date, .hourAndMinute])
                    DatePicker("Ends", selection: $endsDate, displayedComponents: [.date, .hourAndMinute])
                }
                
                Section(header: Text("Repeat")){
                    LabeledContent ("Repeat") {
                        Menu {
                            Button("Never", action: {
                                Repeat = "Never"
                            })
                            Button("Daily", action: {
                                Repeat = "Daily"
                            })
                            Button("Weekly", action: {
                                Repeat = "Weekly"
                            })
                            Button("Monthly", action: {
                                Repeat = "Monthly"
                            })
                            Button("Annually", action: {
                                Repeat = "Annually"
                            })
                        } label: {
                            HStack {
                                Text(Repeat)
                            }
                        }
                        
                    }
                }
            }
            .multilineTextAlignment(.trailing)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                    }
                }
            }
            .navigationTitle("Add")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(showMenu: .constant(false))
    }
}

