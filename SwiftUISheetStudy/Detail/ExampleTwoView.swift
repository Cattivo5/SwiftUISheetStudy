//
//  ExampleTwoView.swift
//  SwiftUISheetStudy
//
//

import SwiftUI

struct ExampleTwoView: View {
    
    @StateObject private var viewModel = ExampleTwoViewModel()
    
    init() { }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
                .padding()
            
            Text(
                """
                The View owns the viewModel as StateObject and uses it to show its title.
                The sheet content does not reference the viewModel and displays static text.
                The isPresented binding is a published property of the viewModel.
                When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened, it is not deallocated.
                """
            )
            .font(.body)
            
            Button("Show sheet") {
                viewModel.isSheetPresented.toggle()
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $viewModel.isSheetPresented, content: {
            VStack {
                Text("ExampleTwo Sheet")
            }
        })
    }
}

#Preview {
    ExampleTwoView()
}

class ExampleTwoViewModel: ObservableObject {
    
    @Published var isSheetPresented: Bool = false
    let title = "ExampleTwoViewModel"
    
    private let uuid = UUID().uuidString
    
    init() {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
    
    deinit {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
}
