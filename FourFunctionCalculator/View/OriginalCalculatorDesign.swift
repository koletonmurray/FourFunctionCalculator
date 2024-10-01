//
//  OriginalCalculatorDesign.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/24/24.
//

import SwiftUI

var oldbody: some View {
    @State var userInput: String = "3 + 4"
    
    return VStack {
        HStack {
            Spacer()
            TextField(
                "Hey",
                text: $userInput
            )
            Spacer()
        }
        .foregroundColor(.gray)
        .multilineTextAlignment(.center) // Ensures the text itself is centered
        .frame(width: 200)
        .padding()
        HStack{
            Button("C ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.red)
                .frame(width: 60, height: 55)
            
            Button("     ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
            //.tint(.blue)
                .disabled(true)
                .frame(width: 60, height: 55)
            
            Button("     ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
            //.tint(.blue)
                .disabled(true)
                .frame(width: 60, height: 55)
            
            Button("÷  ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.orange)
                .frame(width: 60, height: 55)
            
        }
        .padding(.vertical, 3)
        
        HStack{
            Button("7  ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("8 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("9 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("x  ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.orange)
                .frame(width: 60, height: 55)
            
        }
        .padding(.vertical, 3)
        
        HStack{
            Button("4 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            Button("5 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            Button("6 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            Button("-  ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.orange)
                .frame(width: 60, height: 55)
        }
        .padding(.vertical, 3)
        
        HStack{
            Button("1  ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("2 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("3 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("+ ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.orange)
                .frame(width: 60, height: 55)
        }
        .padding(.vertical, 3)
        
        HStack{
            Button("    ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .disabled(true)
                .frame(width: 60, height: 55)
            
            Button("0 ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button(".  ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.blue)
                .frame(width: 60, height: 55)
            
            Button("= ") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.green)
                .frame(width: 60, height: 55)
            
        }
        .padding(.vertical, 3)
    }
    .font(.title)
    .padding()
}
