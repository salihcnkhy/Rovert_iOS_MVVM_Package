//
//  File.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2021.
//

public final class RVTViewControllerShared {
    public init(state: RVTBindable<RVTState>) {
        self.state = state
    }
    
   public var state: RVTBindable<RVTState>
}
