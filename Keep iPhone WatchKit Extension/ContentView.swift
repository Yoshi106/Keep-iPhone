//
//  ContentView.swift
//  Keep iPhone WatchKit Extension
//
//  Created by Yoshiaki Aibara on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var central = Central()
    
    var body: some View {
        VStack {
            Text("Signal Level").font(.title)
            if self.central.label == nil
            {Text("NA")
                .padding()}
            else {Text(String(self.central.label))
                .padding()}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
