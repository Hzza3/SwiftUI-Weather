//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Hazzaa on 12/01/2024.
//

import Foundation
import SwiftUI


struct WeatherButton: View {
    var buttonTitle: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(buttonTitle)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
