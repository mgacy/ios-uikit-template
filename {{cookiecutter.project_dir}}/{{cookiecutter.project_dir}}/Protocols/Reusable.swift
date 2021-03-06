//
//  Reusable.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//
//  Based on code from:
//  https://cocoacasts.com/dequeueing-reusable-views-with-generics-and-protocols
//  https://github.com/sergdort/CleanArchitectureRxSwift
//

import UIKit

protocol Reusable: AnyObject {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}

// MARK: - View Controller

extension UIViewController: Reusable {
    class func instance() -> Self {
        let storyboard = UIStoryboard(name: reuseID, bundle: nil)
        return storyboard.instantiateViewController()
    }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.reuseID) as? T else {
            fatalError("Unable to instantiate view controller: \(T.self)")
        }
        return viewController
    }
}

// MARK: - Collection View

extension UICollectionReusableView: Reusable {}

extension UICollectionView {

    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseID)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable collection view cell: \(T.self)")
        }
        return cell
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, for indexPath: IndexPath) -> T {
        guard let section = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseID,
                                                             for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable supplementary view: \(T.self)")
        }
        return section
    }

}

extension UICollectionViewLayout {

    func register<T: Reusable>(viewType: T.Type) {
        register(viewType, forDecorationViewOfKind: T.reuseID)
    }
}

extension NSCollectionLayoutDecorationItem {

    class func background<T: Reusable>(elementType: T.Type) -> Self {
        return background(elementKind: T.reuseID)
    }
}

// MARK: - Table View

extension UITableViewCell: Reusable {}

extension UITableView {

    func register<T: UITableViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellReuseIdentifier: cellType.reuseID)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable table view cell: \(T.self)")
        }
        return cell
    }

}
