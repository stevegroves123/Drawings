//
//  CircuitDiagram.swift
//  Drawings
//
//  Created by steve groves on 10/04/2020.
//  Copyright © 2020 steve groves. All rights reserved.
//

import SwiftUI

struct CircuitDiagram: View {
    @Binding var ledOn: Bool
    var body: some View {
        HStack {
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 75, height: 20)
                            Rectangle()
                                .frame(width: 201, height: 1)
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 73, height: 18)
                                .shadow(radius: 8)
                            }
        //              battery
                        HStack {
                            Rectangle()
                                .frame(width: 38, height: 1)
                            Rectangle()
                                .frame(width: 5, height: 20)
                                .shadow(radius: 8)
                            Rectangle()
                                .frame(width: 5, height: 40)
                                .shadow(radius: 8)
                            Rectangle()
                                .frame(width: 35, height: 1)
                        }
                            .rotationEffect(.degrees(270))
                            .offset(x: -100)
                            .padding()
                        //lines to LED
                        Rectangle()
                            .frame(width: 108, height: 1)
                            .rotationEffect(.degrees(90))
                            .offset(x:100, y: -45)
                        HStack {
                            Rectangle()
                                .frame(width: 97, height: 1)
                            Rectangle()
                                .frame(width: 96, height: 1)

                        }
                        // Led
                        ZStack {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 22, height: 32)
                                .offset(x: 12)
                            Circle()
                                .fill(Color.black)
                                .frame(width: 32, height: 32)
                            Circle()
                                .fill(ledOn == false ? Color.primary : Color.red)
                                .frame(width: 30, height: 30)
                                .shadow(radius: 20)
                            
                            Rectangle()
                                .fill(ledOn == false ? Color.primary : Color.red)
                                .frame(width: 20, height: 30)
                                .offset(x: 12)

                            Rectangle()
                                .frame(width: 20, height: 1  )
                                .offset(x: 26, y: -4)
                            Rectangle()
                            .frame(width: 20, height: 1  )
                            .offset(x: 26, y: 4)
                        }
                            .rotationEffect(.degrees(270))
                            .offset(y: 12)
                    }.frame(width: 300, height: 300)
        }
    }
}

struct CircuitDiagram_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDiagram(ledOn: .constant(false))
    }
}
