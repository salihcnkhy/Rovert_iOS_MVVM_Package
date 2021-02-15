//
//  RVTUseCase.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

open class RVTUseCase<TRepository>: RVTUseCaseProtocol where TRepository: RVTRepositoryProtocol {
    
    public var repository: TRepository
    
    required public init() {
        repository = .init()
    }
}
