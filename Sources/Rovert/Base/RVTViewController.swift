//
//  RVTViewController.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 6.02.2021.
//

import UIKit

open class RVTViewController<TViewModel>: UIViewController, RVTViewControllerProtocol where TViewModel: RVTViewModelProtocol {
    
    public var viewModel: TViewModel!
    // TODO: Why should have to store that id
    public var storyboardID: String!
    
    // TODO: Is there can be different way to present a vc??
    public func go<TViewController: RVTViewControllerProtocol>(to: TViewController.Type, storyboard: String, afterCreation: ((TViewController) -> Void)? = nil) {
        let builder = RVTViewControllerBuilder<TViewController>()
        let vc = builder.instantiate(with: storyboard, afterCreation: afterCreation)
        
        guard let nc = self.navigationController
        else { fatalError("Please embed your viewcontroller to navigationController") }
       
        if TViewController.ViewModelType.self == Self.ViewModelType {
            vc.viewModel = (self.viewModel as! TViewController.ViewModelType)
        }
        nc.pushViewController(vc, animated: true)
    }
    
    // TODO: If those open funcs will be in all vc then those should be in protocol
    open func bindViewModel() { }
    
    open func setupViews() { }
    
    // TODO: Is overrideable deinit possible??
    deinit {
        print("Deiniting: " + NSStringFromClass(Self.self).components(separatedBy: ".")[1])
    }
}

