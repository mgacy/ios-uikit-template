//
//  DeepLink.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  https://github.com/imaccallum/CoordinatorKit
//

import UIKit.UIApplication
import UserNotifications

enum DeepLink {
    /// Show onboarding scene.
    case onboarding
    /// Respond to launch from remote notification.
    case remoteNotification([String: AnyObject])
    /// Show share sheet.
    case share(title: String, url: URL)
}

// MARK: - Builders
extension DeepLink {

    static func build(with dict: [String: AnyObject]?) -> DeepLink? {
        guard let id = dict?["launch_id"] as? String else { return nil }

        switch id {
        case DeepLinkURLConstants.onboarding: return .onboarding
        default: return nil
        }
    }

    static func build(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> DeepLink? {
        guard let notification = launchOptions?[.remoteNotification] as? [String: AnyObject] else {
            return nil
        }
        // TODO: perform any further verifications of structure?
        return .remoteNotification(notification)
    }

    static func build(with url: URL) -> DeepLink? {
        switch url.host {
        default: return nil
        }
    }

    static func build(with userActivity: NSUserActivity) -> DeepLink? {
        return nil
    }

    static func build(with notificationResponse: UNNotificationResponse) -> DeepLink? {
        // let userInfo = notificationResponse.notification.request.content.userInfo
        switch notificationResponse.notification.request.content.categoryIdentifier {
        default:
            // let categoryID = notificationResponse.notification.request.content.categoryIdentifier
            // log.warning("\(#function) - unknown category: \(categoryID)")
            return nil
        }
    }
}

// MARK: - Constants
extension DeepLink {
    struct DeepLinkURLConstants {
        static let onboarding = "onboarding"
    }
}
