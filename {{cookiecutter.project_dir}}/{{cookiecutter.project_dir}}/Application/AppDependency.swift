//
//  AppDependency.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation

class AppDependency: HasFoo {
    let foo: Bool
    
    init() {
        foo = true
    }
}
