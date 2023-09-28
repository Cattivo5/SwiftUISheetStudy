//
//  ExampleThreeView.swift
//  SwiftUISheetStudy
//
//

import SwiftUI

struct ExampleThreeView: View {
    
    @State private var isSheetPresented: Bool = false
    @StateObject private var viewModel = ExampleThreeViewModel()
    
    init() { }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
                .padding()
            
            Text(
                """
                The View owns the viewModel as StateObject and uses it to show its title.
                The sheet also references the viewModel but as an explicit weak capture with viewModel.sheetTitle to show its title.
                The isPresented binding is a State of the view.
                When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened, it is also deallocated.
                """
            )
            .font(.body)
            
            Button("Show sheet") {
                isSheetPresented.toggle()
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $isSheetPresented, content: { [weak viewModel] in
            VStack {
                Text(viewModel?.sheetTitle ?? "")
            }
        })
    }
}

#Preview {
    ExampleThreeView()
}

class ExampleThreeViewModel: ObservableObject {
    let title = "ExampleThreeViewModel"
    let sheetTitle = "ExampleThreeViewModel Sheet"
    
    private let uuid = UUID().uuidString
    
    init() {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
    
    deinit {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
}
