//
//  RVTRepository.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

open class RVTRepository: RVTRepositoryProtocol {
    public var viewControllerShared: RVTViewControllerShared
    public var dataSources: RVTDataSourceDictionary<RVTDataSourceHashableProtocol>
    
    public required init(with viewControllerShared: RVTViewControllerShared) {
        dataSources = .init()
        self.viewControllerShared = viewControllerShared
    }
    
    public func addSource<Value>(key: Value.Type, request: Value.RequestType? = nil) where Value: RVTDataSourceProtocol {
        let source = Value.init(request: request)
        dataSources[key] = source
    }
    
    public func executeSource<Value>(key: Value.Type, binder: @escaping RVTBindable<Value.ResponseType>.Binder) where Value: RVTDataSourceProtocol {
        guard var source = getSource(key: key) else { return }
        viewControllerShared.state.value = .loading
        source.response.bind { [weak self] response in
            guard let self = self else { return }
            self.viewControllerShared.state.value = RVTState.none
            binder(response)
        }
    }
    
    public func getSource<Value>(key: Value.Type) -> Value? where Value: RVTDataSourceProtocol {
        dataSources[key]
    }
}
