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
    
    open func setup() { }

    public func addSource<Value>(key: Value.Type, request: Value.RequestType? = nil, binder: @escaping RVTBindable<Value.ResponseType>.Binder) where Value: RVTDataSourceProtocol {
        var source = Value.init(request: request)
        dataSources[key] = source
        source.response.bind(binder: binder)
    }
    
    public func getSource<Value>(key: Value.Type) -> Value? where Value: RVTDataSourceProtocol {
        dataSources[key]
    }
}
