//
//  RVTUseCase.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

open class RVTUseCase<TRepository>: RVTUseCaseProtocol where TRepository: RVTRepositoryProtocol {
    public var viewControllerShared: RVTViewControllerShared?
    public var repository: TRepository
    public var responseModel: RVTBindable<RVTModelProtocol> = .init()
    
    public required init(with className: String) {
        self.viewControllerShared = RVTSharedManager.shared.viewControllerShareds[className]
        repository = .init(with: className)
        repository.setup()
    }
}
