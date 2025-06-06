//
//  IntSlider.swift
//  MeasuringRope
//
//  Created by HIROKI IKEUCHI on 2023/08/14.
//

import SwiftUI

struct IntSlider<Label>: View where Label: View {
    
    @Binding private var value: Int
    
    private let bounds: ClosedRange<Double>
    private let step: Int
    private let label: () -> Label
        
    var intProxy: Binding<Double> {
        Binding<Double>(
            get: {
                Double(value)
            }, set: {
                value = Int($0)
            })
    }
    
    var body: some View {
        
        Slider(value: self.intProxy,
               in: self.bounds,
               step: Double.Stride(self.step)) {
            label()
        } minimumValueLabel: {
            Text("\(Int(self.bounds.lowerBound))")
        } maximumValueLabel: {
            Text("\(Int(self.bounds.upperBound))")
        }
    }
    
    init(
        value: Binding<Int>,
        in bounds: ClosedRange<Double> = 0...10,
        step: Int = 0,
        @ViewBuilder label: @escaping () -> Label = { EmptyView() }
    ) {
        self._value = value
        self.bounds = bounds
        self.step = step
        self.label = label
    }
}

struct IntSlider_Previews: PreviewProvider {
            
    @State private static var refreshRate = 50
    
    static var previews: some View {
        IntSlider(value: $refreshRate,
                  in: 45...120,
                  step: 5) {
            Text("Refresh rate")
        }
        .padding()
    }
}
