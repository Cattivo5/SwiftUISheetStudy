# SwiftUISheetStudy

This project is made to demonstrate a bug with SwiftUI's .sheet modifier with iOS 17.
The bug causes a view's model to not be deallocated when the view is closed after a sheet was displayed and closed. The view's model is created but never released.

- The given examples demonstrate different approaches to present a sheet which all work with iOS 16 but cause leaks with iOS 17. The minimum deployment target as well as the used Xcode versions have no effect.
- The code used to display the view and the sheet is kept simple and should normally work without problems. The views' models should be deallocated when the view is closed.
- A NavigationStack is used in a master view to display the different example's as DetailViews via NavigationLinks. When returning from the detail view, its allocated resources should be released.
- The examples were made with Xcode 15, tested with Xcode 15, Xcode 14.3 and the minimum deployment targets iOS 16, iOS 17.0, 17.0.1, 17.1 (public beta).

## Example 1: ExampleOneView
- The View owns the viewModel as StateObject and uses it to show its title.
- The sheet also references the viewModel with viewModel.sheetTitle to show its title. 
- The isPresented binding is a State of the view.
- When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened and closed, it is not deallocated.

## Example 2: ExampleTwoView
- The View owns the viewModel as StateObject and uses it to show its title.
- The sheet content does not reference the viewModel and displays static text.
- The isPresented binding is a published property of the viewModel.
- When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened and closed, it is not deallocated.

## Example 3: ExampleThreeView
- The View owns the viewModel as StateObject and uses it to show its title.
- The SheetView has its own model as StateObject. There is no direct reference from the View's viewModel to the sheet or its model.
- The isPresented binding is a State of the view.
- When the sheet is not opened and the view is closed, the viewModel is deallocated. When the sheet was opened and closed, it is not deallocated.
