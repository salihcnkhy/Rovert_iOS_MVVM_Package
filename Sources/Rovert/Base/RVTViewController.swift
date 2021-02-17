//
//  RVTViewController.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

import UIKit

open class RVTViewController<TViewModel>: UIViewController, RVTViewControllerProtocol where TViewModel: RVTViewModelProtocol {
    
    public var className: String = ""
    public var controllerShared: RVTViewControllerShared!
    public var viewModel: TViewModel!
    public var loadingView: RVTLoadingView!
    // TODO: Why should have to store that id
    
    public func setup(with viewModel: TViewModel?, className: String) {
        self.className = className
        controllerShared = .init(state: .init(with: .empty))
        RVTSharedManager.shared.viewControllerShareds[className] = controllerShared
        setupViews()
        self.viewModel = viewModel ?? .init(with: className)
    }
    
    // TODO: Is there can be different way to present a vc??
    public func go<TViewController: RVTViewControllerProtocol>(to: TViewController.Type, storyboard: String, afterCreation: ((TViewController) -> Void)? = nil) {
        let builder = RVTViewControllerBuilder<TViewController>()
        
        var newViewModel: TViewController.ViewModelType?
        
        if TViewController.ViewModelType.self == Self.ViewModelType {
            newViewModel = (self.viewModel as! TViewController.ViewModelType)
        }
        
        let vc = builder.instantiate(with: storyboard, viewModel: newViewModel,afterCreation: afterCreation)
        
        guard let nc = self.navigationController
        else { fatalError("Please embed your viewcontroller to navigationController") }        
        
        nc.pushViewController(vc, animated: true)
    }
    
    // TODO: If those open funcs will be in all vc then those should be in protocol
    open func bindViewModel() { }
    
    open func setupViews() {
        loadingView = .init()
        loadingView.setup(className: className)
    }
    
    // TODO: Is overrideable deinit possible??
    deinit {
        print("Deiniting: " + NSStringFromClass(Self.self).components(separatedBy: ".")[1])
    }
}

