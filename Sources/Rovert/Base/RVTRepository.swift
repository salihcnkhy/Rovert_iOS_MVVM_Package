//
//  RVTRepository.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

open class RVTRepository: RVTRepositoryProtocol {
    public var viewControllerShared: RVTViewControllerShared?
    public var dataSources: RVTDataSourceDictionary<RVTDataSourceHashableProtocol>
    public var responseData: RVTBindable<RVTResponseProtocol> = .init()
    
    public required init(with className: String) {
        dataSources = .init()
        self.viewControllerShared = RVTSharedManager.shared.viewControllerShareds[className]
    }
    
    open func setup() {}
    
    public func addSource<Value>(key: Value.Type, request: Value.RequestType? = nil) where Value: RVTDataSourceProtocol {
        let source = Value.init(request: request)
        dataSources[key] = source
    }
    
    public func executeSource<Value>(key: Value.Type) where Value: RVTDataSourceProtocol {
        guard let source = getSource(key: key) else { return }
        viewControllerShared?.state.value = .loading
        source.response.bind { [weak self] response in
            guard let self = self else { return }
            self.responseData.value = response
            self.viewControllerShared?.state.value = .empty
        }
        source.execute()
    }
    
    public func getSource<Value>(key: Value.Type) -> Value? where Value: RVTDataSourceProtocol {
        dataSources[key]
    }
}
