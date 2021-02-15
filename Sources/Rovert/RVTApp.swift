//
//  RVTApp.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 7.02.2021.
//

import Foundation
import UIKit

public struct RVTApp<TRootVC: RVTViewControllerProtocol> {
    
    // TODO: maybe take window here???
    public init() { }
    
    // TODO: Don't take navigationcontroller instead of window.
    // Create navigationcontroller here as root vc then inject the instantiated rootstoryboard vc
    public func Start(navigationController: UINavigationController, rootStoryboard: String) {
        let builder = RVTViewControllerBuilder<TRootVC>()
        let vc = builder.instantiate(with: rootStoryboard) { vc in
            vc.viewModel = .init()
        }
        navigationController.pushViewController(vc, animated: true)
    }
}
