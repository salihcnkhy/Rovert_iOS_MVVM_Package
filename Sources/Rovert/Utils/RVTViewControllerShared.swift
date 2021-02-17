//
//  File.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2021.
//

public final class RVTViewControllerShared {
    public var state: RVTBindable<RVTState>
    
    public init(className: String, state: RVTBindable<RVTState>) {
        self.state = state
        RVTSharedManager.shared.viewControllerShareds[className] = self
    }
}
