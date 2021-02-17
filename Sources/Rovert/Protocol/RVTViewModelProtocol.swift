//
//  RVTViewModelProtocol.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

public protocol RVTViewModelProtocol {
    associatedtype UseCaseType: RVTUseCaseProtocol
    var useCase: UseCaseType { get }
    var viewControllerShared: RVTViewControllerShared? { get set }
    init(with className: String)

}
