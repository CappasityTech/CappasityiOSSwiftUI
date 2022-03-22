
import Combine
import CappasitySwiftUI

final class ViewModel: ObservableObject {
    
    private let modelReceiver = CappasityModelReceiver()
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoading = false
    @Published var shouldShowModelView = false
    @Published var modelAlias: String = ""
    @Published var model: CappasityModel?
    @Published var error: CappasityServiceError?
    
    init() {
        CappasityService.set(userAlias: "cappasity") //enter user's alias
        subscribeOnModel()
        subscribeOnError()
    }
    
    deinit {
        for subscription in subscriptions {
            subscription.cancel()
        }
    }
    
    func requestModel() {
        isLoading = true
        modelReceiver.receiveModel(withSku: modelAlias)
    }
    
    private func subscribeOnModel() {
        modelReceiver.modelPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                self?.isLoading = false
                self?.model = model
                self?.shouldShowModelView = true
            }
            .store(in: &subscriptions)
    }
    
    private func subscribeOnError() {
        modelReceiver.errorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                self?.isLoading = false
                print("Get error \(error.code): \(error.debugDescription)")
                self?.error = error
        }
            .store(in: &subscriptions)
    }
}
