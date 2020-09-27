//
//  MainCoordinator.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    typealias Dependencies = HasFoo

    private let window: UIWindow
    private let dependencies: Dependencies
    private let router: RouterProtocol

    // MARK: Lifecycle

    init(window: UIWindow, dependencies: Dependencies) {
        self.window = window
        self.dependencies = dependencies
        self.router = Router(navigationController: UINavigationController())
    }

    override func start(with deepLink: DeepLink?) {
        if let deepLink = deepLink {
            switch deepLink {
            default:
                //log.debug("\(String(describing: self)) is unable to handle DeepLink: \(deepLink)")
                startChildren(with: deepLink)
            }
        } else {
            showMain()
        }
    }

    //deinit { print("\(#function) - \(String(describing: self))") }

    // MARK: Flows

    private func showMain() {
        let viewController = MainViewController()
        //viewController.dismissalDelegate = self
        router.setRootModule(viewController, hideBar: false)
        window.rootViewController = router.toPresent()
        window.makeKeyAndVisible()
    }
}

// MARK: - Presentable
extension MainCoordinator: Presentable {
    func toPresent() -> UIViewController {
        return router.toPresent()
    }
}
