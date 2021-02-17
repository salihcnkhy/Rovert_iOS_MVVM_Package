//
//  File.swift
//  
//
//  Created by Salihcan Kahya on 17.02.2021.
//

import Foundation

public struct RVTSharedManager {
    private init() { }
    public static var shared = RVTSharedManager()
    public var viewControllerShareds = [String: RVTViewControllerShared]()
}
