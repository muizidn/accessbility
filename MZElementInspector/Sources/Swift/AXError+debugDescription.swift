//
//  AXError+debugDescription.swift
//  SwiftApp
//
//  Created by Muis on 27/12/19.
//

import Foundation
import ApplicationServices

extension AXError: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .success: return "AXError.success"
        case .failure: return "AXError.failure"
        case .illegalArgument: return "AXError.illegalArgument"
        case .invalidUIElement: return "AXError.invalidUIElement"
        case .invalidUIElementObserver: return "AXError.invalidUIElementObserver"
        case .cannotComplete: return "AXError.cannotComplete"
        case .attributeUnsupported: return "AXError.attributeUnsupported"
        case .actionUnsupported: return "AXError.actionUnsupported"
        case .notificationUnsupported: return "AXError.notificationUnsupported"
        case .notImplemented: return "AXError.notImplemented"
        case .notificationAlreadyRegistered: return "AXError.notificationAlreadyRegistered"
        case .notificationNotRegistered: return "AXError.notificationNotRegistered"
        case .apiDisabled: return "AXError.apiDisabled"
        case .noValue: return "AXError.noValue"
        case .parameterizedAttributeUnsupported: return "AXError.parameterizedAttributeUnsupported"
        case .notEnoughPrecision: return "AXError.notEnoughPrecision"
        @unknown default: return "AXError.unknown"
        }
    }
}
