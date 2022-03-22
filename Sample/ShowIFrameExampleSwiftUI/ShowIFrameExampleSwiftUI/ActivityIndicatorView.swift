
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    @Binding var shouldAnimate: Bool

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        shouldAnimate ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
