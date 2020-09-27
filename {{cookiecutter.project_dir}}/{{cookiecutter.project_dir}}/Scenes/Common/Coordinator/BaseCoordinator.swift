//
//  BaseCoordinator.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

class BaseCoordinator: NSObject, CoordinatorProtocol {

    /// Unique identifier.
    internal let identifier = UUID()

    private var childCoordinators = [UUID: CoordinatorProtocol]()

    func store(coordinator: CoordinatorProtocol) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    // TODO: accept optional to avoid weak/strong dance in onFinishFlow
    func free(coordinator: CoordinatorProtocol) {
        // TODO: recursively free children coordinators?
        childCoordinators[coordinator.identifier] = nil
    }

    // MARK: A

    public func start() {
        start(with: nil)
    }

    public func start(with deepLink: DeepLink?) {
        // ...
    }

    //deinit { print("\(#function) - \(String(describing: self))") }

}

// MARK: - Helper Methods
extension BaseCoordinator {

    public func coordinate(to coordinator: CoordinatorProtocol) {
        store(coordinator: coordinator)
        coordinator.start()
    }

    public func coordinate(to coordinator: CoordinatorProtocol, with deepLink: DeepLink? = nil) {
        // TODO: set onFinishFlow on coordinator
        store(coordinator: coordinator)
        coordinator.start(with: deepLink)
    }

    public func startChildren(with deepLink: DeepLink) {
        childCoordinators.forEach { $1.start(with: deepLink) }
    }
}
