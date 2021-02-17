//
//  RVTViewControllerProtocol.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//
import UIKit

public protocol RVTViewControllerProtocol: UIViewController {
    associatedtype ViewModelType: RVTViewModelProtocol
   
    var viewModel: ViewModelType! { get set }
    var controllerShared: RVTViewControllerShared! { get set }
    var className: String { get }
    func setup(with viewModel: ViewModelType?, className: String)
    func bindViewModel()
    func setupViews()
    func go<TViewController: RVTViewControllerProtocol>(to: TViewController.Type, storyboard: String, afterCreation: ((TViewController) -> Void)?)
}
