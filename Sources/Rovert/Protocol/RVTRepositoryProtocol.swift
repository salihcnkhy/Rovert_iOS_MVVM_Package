//
//  RVTRepository.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

public protocol RVTRepositoryProtocol {
    // TODO: Is this can help to less loc
    var dataSources: RVTDataSourceDictionary<RVTDataSourceHashableProtocol> { get set }
    var viewControllerShared: RVTViewControllerShared { get set }
    init(with viewControllerShared: RVTViewControllerShared)
    func setup()
    func addSource<Value>(key: Value.Type, request: Value.RequestType?, binder: @escaping RVTBindable<Value.ResponseType>.Binder) where Value: RVTDataSourceProtocol
    func getSource<Value>(key: Value.Type) -> Value? where Value: RVTDataSourceProtocol
}
