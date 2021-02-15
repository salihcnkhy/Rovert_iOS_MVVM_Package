//
//  RVTErrorProtocol.swift
//  RovertBase
//
//  Created by Salihcan Kahya on 15.02.2021.
//

public protocol RVTErrorTypeProtocol: RVTModelProtocol, Error {
    var message: String { get }
}
