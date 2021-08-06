﻿//
//  AppCoordinator.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

/*
fileprivate enum LaunchInstructor {
    case onboarding
    case main

    static func configure(with userDefaultsManager: UserDefaultsManagerType) -> LaunchInstructor {
        switch userDefaultsManager.hasShownOnboarding {
        case true:
            return .main
        case false:
            return .onboarding
        }
    }
}
*/

class AppCoordinator: BaseCoordinator {

    private let window: UIWindow
    private let dependencies: AppDependency

    init(window: UIWindow) {
        self.window = window
        self.dependencies = AppDependency()
    }

    override func start(with deepLink: DeepLink?) {
        if let deepLink = deepLink {
            // log.debug("\(#function) - \(deepLink)")
            switch deepLink {
            default:
                startChildren(with: deepLink)
            }
        } else {
            /*
            switch LaunchInstructor.configure(with: dependencies.userDefaultsManager) {
            case .onboarding:
                showOnboarding()
            case .main:
                showMain()
            }
            */
            showMain()
        }
    }

    // MARK: - Flows
    /*
    private func showOnboarding() {
        let coordinator = OnboardingCoordinator(window: window, dependencies: dependencies)
        coordinator.onFinishFlow = { [weak self, weak coordinator] result in
            if let strongCoordinator = coordinator {
                self?.free(coordinator: strongCoordinator)
            }
            self?.showMain()
        }
        store(coordinator: coordinator)
        coordinator.start()
    }
    */
    private func showMain() {
        let mainCoordinator = MainCoordinator(window: window, dependencies: dependencies)
        store(coordinator: mainCoordinator)
        mainCoordinator.start()
    }
}
