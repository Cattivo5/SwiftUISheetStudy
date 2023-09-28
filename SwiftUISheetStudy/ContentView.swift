//
//  ContentView.swift
//  SwiftUISheetStudy
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                NavigationLink("Example 1") {
                    ExampleOneView()
                }
                
                NavigationLink("Example 2") {
                    ExampleTwoView()
                }
                
                NavigationLink("Example 3") {
                    ExampleThreeView()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
