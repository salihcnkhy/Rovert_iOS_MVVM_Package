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
}
