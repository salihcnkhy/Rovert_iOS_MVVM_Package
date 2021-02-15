//
//  RVTRepository.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 12.02.2021.
//

open class RVTRepository: RVTRepositoryProtocol {
    public var dataSources: RVTDataSourceDictionary<RVTDataSourceHashableProtocol>
    
    public required init() {
        dataSources = .init()
    }
}
