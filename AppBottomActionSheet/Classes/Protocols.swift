//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import UIKit

public enum HalfSheetTopVCTransitionStyle {
    case slide
    case fade

    internal var isSlide: Bool {
        return self == .slide
    }

    internal var isFade: Bool {
        return self == .fade
    }
}

public enum DismissMethod {
    case tap
    case swipe
}

internal extension Array where Element == DismissMethod {
    
    internal var allowSwipe: Bool {
        return contains(.swipe)
    }

    internal var allowTap: Bool {
        return contains(.tap)
    }
}

public protocol HalfSheetPresentableProtocol: class {
    weak var managedScrollView: UIScrollView? { get }
    var dismissMethod: [DismissMethod] { get }
    var sheetHeight: CGFloat? { get }
}

public protocol HalfSheetTopVCProviderProtocol: class {
     var topVC: UIViewController { get }
     var topVCTransitionStyle: HalfSheetTopVCTransitionStyle { get }
}

public protocol HalfSheetCompletionProtocol: class {
    func didDismiss()
}

public protocol HalfSheetAppearanceProtocol: class {    
    var presentAnimationDuration: TimeInterval { get }
    var dismissAnimationDuration: TimeInterval { get }
}

public extension HalfSheetPresentableProtocol where Self: UIViewController {
    public func didUpdateSheetHeight() {
        (navigationController?.transitioningDelegate as? HalfSheetPresentationManager ?? transitioningDelegate as? HalfSheetPresentationManager)?.didChangeSheetHeight()
    }
}
