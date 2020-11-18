//
//  ContentView.swift
//  Keep iPhone
//
//  Created by Yoshiaki Aibara on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var peripheral = Peripheral()
    @State var startAdvertise = true
    
    var body: some View {
        VStack {
            Text("SEND SIGNAL")
                .font(.title)
                .padding()
            HStack(spacing: 20) {
                Button(action: { self.peripheral.startAdvertise() }) { Text("START")
                    .font(.title2) }
                Button(action: { self.peripheral.stopAdvertise() }) { Text("STOP")
                    .font(.title2) }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

