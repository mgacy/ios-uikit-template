//
//  CoordinatorProtocol.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  https://github.com/imaccallum/CoordinatorKit
//

import Foundation

protocol CoordinatorProtocol: class {
    //associatedtype CoordinationResult
    //associatedtype Transition
    //associatedtype Scene
    var identifier: UUID { get }
    func start()
    func start(with: DeepLink?)
}
