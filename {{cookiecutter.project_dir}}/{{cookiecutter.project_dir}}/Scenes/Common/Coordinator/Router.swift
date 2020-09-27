//
//  Router.swift
//  Adequate
//
//  https://github.com/imaccallum/CoordinatorKit
//

import UIKit

final public class Router: NSObject, RouterProtocol, UINavigationControllerDelegate {

    private var completions: [UIViewController: () -> Void]

    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }

    public var hasRootController: Bool {
        return rootViewController != nil
    }

    public let navigationController: UINavigationController

    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        self.navigationController.delegate = self
    }

    public func present(_ module: Presentable, animated: Bool = true) {
        navigationController.present(module.toPresent(), animated: animated, completion: nil)
    }

    public func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    public func push(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {

        let controller = module.toPresent()

        // Avoid pushing UINavigationController onto stack
        guard controller is UINavigationController == false else {
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }

        navigationController.pushViewController(controller, animated: animated)
    }

    public func popModule(animated: Bool = true)  {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    public func setRootModule(_ module: Presentable, hideBar: Bool = false) {
        // Call all completions so all coordinators can be deallocated
        completions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresent()], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }

    // public func setRootModule(_ module: Presentable, navBarStyle: NavBarStyle = .normal) {
    //     // Call all completions so all coordinators can be deallocated
    //     completions.forEach { $0.value() }
    //     navigationController.setViewControllers([module.toPresent()], animated: false)
    //     navigationController.applyStyle(navBarStyle)
    // }

    public func popToRootModule(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }

    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}

// MARK: Presentable
extension Router {
    public func toPresent() -> UIViewController {
        return navigationController
    }
}

// MARK: UINavigationControllerDelegate
extension Router {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        // Ensure the view controller is popping
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }

        runCompletion(for: poppedViewController)
    }
}
