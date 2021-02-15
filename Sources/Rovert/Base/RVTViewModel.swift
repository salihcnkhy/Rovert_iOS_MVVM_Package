//
//  RVTViewModel.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

import Foundation

// TODO: Do i really need to UseCase, I might have direct access to repository from here
open class RVTViewModel<TUseCase>: RVTViewModelProtocol where TUseCase: RVTUseCaseProtocol {
    public let useCase: TUseCase
   
    required public init() {
        useCase = .init()
    }
    deinit {
        print("Deiniting: " + NSStringFromClass(Self.self).components(separatedBy: ".")[1])
    }
}
