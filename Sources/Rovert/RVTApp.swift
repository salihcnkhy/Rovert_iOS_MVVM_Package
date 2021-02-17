//
//  RVTApp.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 7.02.2021.
//

import Foundation
import UIKit

public struct RVTApp<TRootVC: RVTViewControllerProtocol> {
    
    var window: UIWindow
    
    // TODO: maybe take window here???
    @available(iOS 13.0, *)
    public init(window: UIWindow, scene: UIWindowScene? = nil) {
        self.window = window
        self.window.windowScene = scene
    }
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func Start(rootStoryboard: String) {
        let navigationController = UINavigationController()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()

        let builder = RVTViewControllerBuilder<TRootVC>()
        let vc = builder.instantiate(with: rootStoryboard)
        navigationController.pushViewController(vc, animated: true)
    }

}
