//
//  ContentView.swift
//  Length Conversion
//
//  Created by Nilesh Rathod on 14/04/23.
//

import SwiftUI

enum LengthUnit: String, CaseIterable {
    case METER = "Meters"
    case KM = "KM"
    case FEET = "Feet"
    case YARDS = "Yards"
    case MILES = "Miles"
}

struct ContentView: View {
    
    
    @State var inputConversionType = LengthUnit.METER
    @State var outputConversionType = LengthUnit.KM
    @State var inputNumber = 0.0
    
    @FocusState var inputFocus : Bool
    
    var convesrionResult : Double {
        
        let inputlengthInMeters: Double
        let result: Double
        
        switch inputConversionType {
        case .METER:
            inputlengthInMeters = inputNumber
        case .KM:
            inputlengthInMeters = (inputNumber ) * 1000
        case .FEET:
            inputlengthInMeters = (inputNumber ) / 3.2808399
        case .YARDS:
            inputlengthInMeters = (inputNumber ) / 1.094
        case .MILES:
            inputlengthInMeters = (inputNumber) * 1609
        }
        
        switch outputConversionType {
        case .METER:
            result = inputlengthInMeters
        case .KM:
            result = inputlengthInMeters / 1000
        case .FEET:
            result = inputlengthInMeters * 3.2808399
        case .YARDS:
            result = inputlengthInMeters * 1.094
        case .MILES:
            result = inputlengthInMeters / 1609
        }
        return result
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Picker("Select input type", selection: $inputConversionType){
                        ForEach(LengthUnit.allCases, id: \.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Select the input type of conversion")
                }
                
                Section {
                    TextField("Enter Number", value: $inputNumber, format:.number)
                        .keyboardType(.numberPad)
                        .focused($inputFocus)
                }
                
                Section {
                    Picker("Select output type", selection: $outputConversionType){
                        ForEach(LengthUnit.allCases, id: \.self){
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Select the output type of conversion")
                }
                
                Section {
                    Text(convesrionResult, format :.number)
                } header: {
                    Text("Select the output type of conversion")
                }
            }
            .navigationTitle("Unit Conversions")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        inputFocus = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
