//
//  ExampleThreeView.swift
//  SwiftUISheetStudy
//
//

import SwiftUI

struct ExampleThreeView: View {
    
    @State private var isSheetPresented: Bool = false
    @StateObject private var viewModel: ExampleThreeViewModel
    
    init() {
        // Please note: The view model does not leak when it is directly initialized as StateObject in line 12.
        // As this form of init is also officially supported by Apple, it should also work (but doesn't).
        self._viewModel = .init(wrappedValue: ExampleThreeViewModel())
    }
    
    func onDismiss() {
        print("sheet dismissed")
    }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
                .padding()
            
            Text(
                """
                The View owns the viewModel as StateObject and uses it to show its title.
                The SheetView has its own model as StateObject. There is no direct reference from the View's viewModel to the sheet or its model.
                The isPresented binding is a State of the view.
                When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened and closed, it is not deallocated.
                """
            )
            .font(.body)
         
            Button("Show sheet") {
                isSheetPresented.toggle()
            }
            .padding()
        }
        .padding()
        .sheet(
            isPresented: $isSheetPresented,
            onDismiss: onDismiss,
            content: {
                SheetContent()
                .onAppear {
                    print("sheet appeared")
                }
            }
        )
    }
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


class SheetModel: ObservableObject {
    let title = "Sheet Model"
    let content = "Sheet Content"
    
    private let uuid = UUID().uuidString
    
    init() {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
    
    deinit {
        print("\(String(describing: self)) \(uuid) \(#function)")
    }
}

struct SheetContent: View {
    @StateObject private var model: SheetModel
    
    init() {
        self._model = .init(wrappedValue: SheetModel())
    }
    
    var body: some View {
        VStack {
            Text(model.title)
                .padding()
            
            Text(model.content)
                .padding()
        }
        .padding()
    }
}


#Preview {
    ExampleThreeView()
}
