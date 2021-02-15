//
//  RVTUseCase.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

open class RVTUseCase<TRepository>: RVTUseCaseProtocol where TRepository: RVTRepositoryProtocol {
    public var viewControllerShared: RVTViewControllerShared
    public var repository: TRepository

    public required init(with viewControllerShared: RVTViewControllerShared) {
        self.viewControllerShared = viewControllerShared
        repository = .init(with: viewControllerShared)
    }
}
