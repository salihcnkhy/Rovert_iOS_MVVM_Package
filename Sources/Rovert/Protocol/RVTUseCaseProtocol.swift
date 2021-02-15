//
//  RVTUseCase.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

public protocol RVTUseCaseProtocol {
    associatedtype RepositoryType: RVTRepositoryProtocol
    var repository: RepositoryType { get set }
    init()
}
