//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Hazzaa on 12/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var days = [
        WeatherDay(day: "TUE", image: "cloud.sun.fill", temperature: 74),
        WeatherDay(day: "WED", image: "sun.max.fill", temperature: 88),
        WeatherDay(day: "THU", image: "wind.snow", temperature: 55),
        WeatherDay(day: "FRI", image: "sunset.fill", temperature: 60),
        WeatherDay(day: "SAT", image: "snow", temperature: 25),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cairo, Egypt")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                HStack(spacing: 20){
                    WeatherDayView(day: days[0])
                    WeatherDayView(day: days[1])
                    WeatherDayView(day: days[2])
                    WeatherDayView(day: days[3])
                    WeatherDayView(day: days[4])
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonTitle: "Change Day Time",
                                  backgroundColor: .white,
                                  textColor: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var day: WeatherDay
    
    var body: some View {
        VStack {
            Text(day.day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: day.image)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(day.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [
//            isNight ? .black : .blue,
//            isNight ? .gray : Color("lightBlue")
//        ]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

