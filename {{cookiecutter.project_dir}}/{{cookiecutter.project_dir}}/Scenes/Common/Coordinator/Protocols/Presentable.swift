//
//  Presentable.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  https://github.com/imaccallum/CoordinatorKit
//

import UIKit

public protocol Presentable {
    func toPresent() -> UIViewController
}

// MARK: - UIViewController + Presentable
extension UIViewController: Presentable {
    public func toPresent() -> UIViewController {
        return self
    }
}
