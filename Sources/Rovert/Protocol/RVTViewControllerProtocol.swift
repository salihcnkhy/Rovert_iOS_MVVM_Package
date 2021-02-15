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
    func bindViewModel()
    func setupViews()
    func go<TViewController: RVTViewControllerProtocol>(to: TViewController.Type, storyboard: String, afterCreation: ((TViewController) -> Void)?)
}
