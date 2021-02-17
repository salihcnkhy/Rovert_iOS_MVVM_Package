//
//  RVTDataSource.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

import Foundation

open class RVTDataSource<TRequest, TResponse>: RVTDataSourceProtocol where TResponse: RVTResponseProtocol, TRequest: RVTRequestProtocol {

    public var request: TRequest?
    public var response: RVTBindable<TResponse> = .init()

    public var hashValue: String
    public func isEqualTo(another: RVTDataSourceHashableProtocol) -> Bool {
        return hashValue.elementsEqual(another.hashValue)
    }
    
    public required init(request: TRequest? = nil) {
        self.request = request
        hashValue = NSStringFromClass(Self.self)
    }
}
