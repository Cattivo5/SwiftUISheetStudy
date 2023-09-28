//
//  ExampleOneView.swift
//  SwiftUISheetStudy
//
//

import SwiftUI

struct ExampleOneView: View {
    
    @State private var isSheetPresented: Bool = false
    @StateObject private var viewModel = ExampleOneViewModel()
    
    init() { }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
                .padding()
            
            Text(
                """
                The View owns the viewModel as StateObject and uses it to show its title.
                The sheet also references the viewModel with viewModel.sheetTitle to show its title. 
                The isPresented binding is a State of the view.
                When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened, it is not deallocated.
                """
            )
            .font(.body)
         
            Button("Show sheet") {
                isSheetPresented.toggle()
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                Text(viewModel.sheetTitle)
            }
        })
    }
}

#Preview {
    ExampleOneView()
}

class ExampleOneViewModel: ObservableObject {
    let title = "ExampleOneViewModel"
    let sheetTitle = "ExampleOneViewModel Sheet"
    
    private let uuid = UUID().uuidString
    
    init() {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
    
    deinit {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
}
