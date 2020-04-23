//
//  ContentView.swift
//  Drawings
//
//  Created by steve groves on 09/04/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var current: Double = 0.000
    @State var ledOn: Bool = false
    @State var myHour = 0
    @State var myMinute = 0
    @State var mySecond = 0
    @State var myDay = 0
    @State var components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date())
    
   
    // timer to update dispaly
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in self.components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date())
            self.myHour = self.components.hour ?? 0
            self.myMinute = self.components.minute ?? 0
            self.mySecond = self.components.second ?? 0
            self.myDay = self.components.day ?? 0
            self.ledOn.toggle()
            self.current = (Double(self.myHour) / Double(self.myMinute))
        })
    }
    
    var body: some View {
        VStack {
            Text("Current flowing = \(current, specifier: "%.3f") Amps")
            ZStack {
            Text("\(myHour) V")
                    .offset(x: 15, y: -130)
                    .rotationEffect(.degrees(270))
            CircuitDiagram(ledOn: $ledOn)
            Text("\(myMinute) ohms")
                    .offset(x: 0, y: -100)
            }
        }
        .onAppear(perform: {let _ = self.updateTimer})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
