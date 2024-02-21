//
//  CalendarView.swift
//  CS160MobileApp
//
//  Created by Frank on 2024/3/17.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var showMenu: Bool
    
    @State private var weekOffset = 0
    @State private var selectedDate: Date? = Date()
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let currentDate = Date()
    private let calendar = Calendar.current
    
    @State private var tasks: [ToDo] = [
        ToDo(dayOffset: 0, time: "9:00 AM", title: "Meeting"),
        ToDo(dayOffset: 1, time: "11:00 AM", title: "Design Review"),
        ToDo(dayOffset: -1, time: "2:00 PM", title: "Team Sync"),
        // Add more tasks as needed
    ]
    
    func dayOfWeek(for dayOffset: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" // Abbreviated day of the week
        let targetDate = calendar.date(byAdding: .day, value: dayOffset + (weekOffset * 7), to: Date())!
        return dateFormatter.string(from: targetDate)
    }
    
    func dayOfMonth(for dayOffset: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d" // Day of the month as number
        let targetDate = calendar.date(byAdding: .day, value: dayOffset + (weekOffset * 7), to: Date())!
        return dateFormatter.string(from: targetDate)
    }
    
    func isTaskOnSelectedDate(task: ToDo) -> Bool {
        guard let selectedDate = selectedDate else { return false }
        let taskDate = calendar.date(byAdding: .day, value: task.dayOffset, to: currentDate)!
        return calendar.isDate(selectedDate, inSameDayAs: taskDate)
    }
    
    func currentMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM" // "MMMM" is the date format string for the full month name.
        let month = dateFormatter.string(from: Date()) // Date() represents the current date and time.
        return month
    }
    
    private func selectDate(offset: Int) {
        let newSelectedDate = calendar.date(byAdding: .day, value: offset + (weekOffset * 7), to: Date())!
        selectedDate = newSelectedDate
    }
    
    private func isDateSelected(offset: Int) -> Bool {
        guard let selectedDate = selectedDate else { return false }
        let targetDate = calendar.date(byAdding: .day, value: offset + (weekOffset * 7), to: Date())!
        return calendar.isDate(selectedDate, inSameDayAs: targetDate)
    }
    
    private func handleGesture(_ gesture: DragGesture.Value) {
        // A simple threshold to decide when the swipe is enough to change the week
        let dragThreshold: CGFloat = 100.0
        
        if gesture.translation.width > dragThreshold {
            withAnimation(.easeInOut) {
                weekOffset -= 1
            }
        } else if gesture.translation.width < -dragThreshold {
            withAnimation(.easeInOut) {
                weekOffset += 1
            }
        }
    }
    
    
    var body: some View {
        NavigationStack{
            
            VStack {
                
                VStack {
                    
                    Text(currentMonth())
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.leading, 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 20)
                
                HStack(spacing: 15) {
                    ForEach(-3...3, id: \.self) { offset in
                        Button(action: {
                            self.selectDate(offset: offset)
                        }) {
                            VStack {
                                Text(dayOfWeek(for: offset))
                                    .font(.system(size: 10))
                                
                                Text(dayOfMonth(for: offset))
                                    .font(.subheadline)
                            }.frame(width: 40, height: 40, alignment: .center)
                                .background(isDateSelected(offset: offset) ? Color.blue.opacity(0.3) : Color.clear)
                                .cornerRadius(5)
                            
                        }
                    }
                }
                
            }.padding(.bottom, 20)
                .highPriorityGesture(
                    DragGesture().onEnded({ self.handleGesture($0) })
                )
            
            
            ScrollView(.vertical) {
                ForEach(tasks) { task in
                    if isTaskOnSelectedDate(task: task) {
                        Text("\(task.time) - \(task.title)")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(5)
                            .padding(.horizontal)
                    }
                }
                
            }.toolbar {
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
            .navigationTitle("Calendar")
            
        }
    }
}


struct CalendarView_Previews : PreviewProvider {
    static var previews: some View{
        CalendarView(showMenu: .constant(false))
    }
}
