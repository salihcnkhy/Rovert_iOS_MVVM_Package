//
//  RVTViewControllerBuilder.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 7.02.2021.
//

import UIKit

struct RVTViewControllerBuilder<TViewController> where TViewController: RVTViewControllerProtocol {
    public init() { }
    public func instantiate(with storyboard: String, viewModel: TViewController.ViewModelType? = nil , maybeWith bundle: Bundle? = nil, afterCreation: ((TViewController) -> Void)? = nil) -> TViewController {
        let fullName = NSStringFromClass(TViewController.self)
        let className = fullName.components(separatedBy: ".")[1]
        
        let instanceVC = UIStoryboard(name: storyboard, bundle: bundle)
            .instantiateViewController(withIdentifier: className) as? TViewController
        guard let vc = instanceVC else { fatalError("There is no storybord or storyboard identifier") }
        vc.setup(with: viewModel, className: className)
        afterCreation?(vc)
        return vc
    }
}
