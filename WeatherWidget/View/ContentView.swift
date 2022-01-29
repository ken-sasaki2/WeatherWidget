//
//  ContentView.swift
//  WeatherWidget
//
//  Created by sasaki.ken on 2022/01/29.
//

import SwiftUI

struct ContentView: View {
    private let weatherVM = WeatherViewModel()
    
    var body: some View {
        Button {
            Task {
                await weatherVM.fetchWeathers()
            }
        } label: {
            Text("天気情報取得")
                .font(.system(size: 18, weight: .medium, design: .default))
                .padding(.horizontal, 80)
                .padding(.vertical, 12)
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
