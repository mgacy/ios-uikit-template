//
//  Coordinator.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

class Coordinator: BaseCoordinator {
    let router: RouterProtocol

    init(router: RouterProtocol) {
        self.router = router
    }
}

extension Coordinator: Presentable {
    func toPresent() -> UIViewController {
        return router.toPresent()
    }
}
