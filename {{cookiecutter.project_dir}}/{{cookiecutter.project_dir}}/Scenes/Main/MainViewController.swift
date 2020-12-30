//
//  MainViewController.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on {{ cookiecutter.date }}.
//  Copyright © {{ cookiecutter.year }} {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Subviews

    private let label: UILabel = {
        let view = UILabel()
        view.text = "This is just a test"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle

    //required init?(coder aDecoder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    //}

    //override func loadView() {
    //    let view = UIView()
    //    
    //    // ...
    //    
    //    self.view = view
    //    setupConstraints()
    //}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - View Methods

    func setupView() {
        view.backgroundColor = .white
        // ...
        view.addSubview(label)
    }

    func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            //view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0.0),
            //view.topAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0.0),
            //view.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0.0),
            //view.bottomAnchor.constraint(equalTo: retryButton.topAnchor, constant: 0.0)
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - A

    // ...

}
