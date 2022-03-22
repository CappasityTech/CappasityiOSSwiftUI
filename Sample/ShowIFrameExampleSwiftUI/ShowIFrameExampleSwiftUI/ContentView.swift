
import SwiftUI
import CappasitySwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let model = viewModel.model {
                    NavigationLink(destination: ModelView(model: model), isActive: $viewModel.shouldShowModelView) {
                        EmptyView()
                    }
                }
                Spacer()
                ActivityIndicatorView(shouldAnimate: $viewModel.isLoading)
                Spacer()
                HStack(spacing: 20) {
                    Spacer()
                    TextField("Model's SKU", text: $viewModel.modelAlias)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Search") {
                        hideKeyboard()
                        viewModel.requestModel()
                    }
                    Spacer()
                }
                Spacer()
            }.alert(item: $viewModel.error) { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription))
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
