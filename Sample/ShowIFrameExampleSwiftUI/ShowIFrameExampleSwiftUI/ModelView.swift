
import SwiftUI
import CappasitySwiftUI

struct ModelView: View {
    
    @State private var isLoading = true
    @State private var action: CappasityModelViewAction = .idle
    @State private var error: CappasityServiceError? = nil
    private let model: CappasityModel
    
    var body: some View {
        ZStack {
            ActivityIndicatorView(shouldAnimate: $isLoading)
            CappasityModelView(model: model, action: $action) {
                isLoading = false
            } onFailure: { error in
                self.error = error
                isLoading = false
            }.customize(isAutorun: true, isHintHidden: true)
        }.alert(item: $error) { error in
            Alert(title: Text("Error"), message: Text(error.localizedDescription))
        }
    }
    
    init(model: CappasityModel) {
        self.model = model
    }
}
