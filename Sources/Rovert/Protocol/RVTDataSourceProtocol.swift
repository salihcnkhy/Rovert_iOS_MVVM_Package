//
//  RVTDataSourceProtocol.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

public protocol RVTDataSourceHashableProtocol {
    var hashValue: String { get }
    func isEqualTo(another: RVTDataSourceHashableProtocol) -> Bool
}

public protocol RVTDataSourceProtocol: RVTDataSourceHashableProtocol {
    associatedtype RequestType: RVTRequestProtocol
    associatedtype ResponseType: RVTResponseProtocol
    var request: RequestType? { get set }
    var response: ResponseType? { get set }
    init(request: RequestType?)
}
