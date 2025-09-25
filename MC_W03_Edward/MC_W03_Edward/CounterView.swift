//
//  CounterView.swift
//  MC_W03_Edward
//
//  Created by student on 25/09/25.
//

import SwiftUI

struct CounterView: View {
    @Binding var count: Int
    var body: some View {
        VStack{
            Text("Child View (CounterView")
                .font(.headline)
            HStack{
                Button("-") {
                    count -= 1
                }.buttonStyle(.bordered)
                Button("+") {
                    count += 1
                }.buttonStyle(.bordered)
            }
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
    }
        
}

