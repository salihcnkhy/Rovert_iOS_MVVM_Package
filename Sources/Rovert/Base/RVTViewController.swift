//
//  RVTViewController.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

import UIKit

open class RVTViewController<TViewModel>: UIViewController, RVTViewControllerProtocol where TViewModel: RVTViewModelProtocol {
    
    public var controllerShared: RVTViewControllerShared!
    public var viewModel: TViewModel!
    // TODO: Why should have to store that id
    
    public func setup(with viewModel: TViewModel?, className: String) {
        controllerShared = .init(className: className, state: .init(with: RVTState.none))
        bindLoading()
        self.viewModel = viewModel ?? .init(with: controllerShared)
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
    
    open func setupViews() { }
    
    private func bindLoading() {
        controllerShared.state.bind { [weak self] state in
            guard let _ = self else { return }
            print("Şu anda state: \(String(describing: state))")
        }
    }
    
    // TODO: Is overrideable deinit possible??
    deinit {
        print("Deiniting: " + NSStringFromClass(Self.self).components(separatedBy: ".")[1])
    }
}

