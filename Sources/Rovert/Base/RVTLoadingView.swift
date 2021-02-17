//
//  File.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import UIKit

open class RVTLoadingView: UIView {
    var indicator = RVTIndicator()
    var viewControllerShared: RVTViewControllerShared?
   
    public func setup(viewControllerShared: RVTViewControllerShared) {
       
        self.viewControllerShared = viewControllerShared
        bindParentViewController()
       
        backgroundColor = UIColor(white: 0, alpha: 0.7)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    public func bindParentViewController() {
        self.viewControllerShared?.state.bind { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .empty:
                self.isHidden = true
            case .loading:
                self.isHidden = false
            default:
                break
            }
        }
    }
}
