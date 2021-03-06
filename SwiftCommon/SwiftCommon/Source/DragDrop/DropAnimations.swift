//
//  DropAnimations.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/15/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

public class DropAnimations: CAAnimation {
    
    // MARK: Delegate Functions
    var acceptDropDidComplete: ((UIView)->Void)?
    
    // MARK: Public API
    public func performAcceptDrop(view: UIView) {
        animatingView = view
        
        let wrapper = NSValue(CGRect: view.frame)
        self.setValue(wrapper, forKey: Key.viewFrame)
        
        let zoomOut = CABasicAnimation.zoomOut(0.3)
        zoomOut.delegate = self
        zoomOut.setID(Key.acceptDropAnimation)
        view.layer.addAnimation(zoomOut, forKey: Key.acceptDropAnimation)
    }
    
    // MARK: Internal API
    final func acceptDropEnded() {if let view = animatingView {tellDelegate(acceptDropDidComplete, view)}}
    
    // MARK: CAAnimation Delegate
    override public func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if anim.isAnimation(Key.acceptDropAnimation) {acceptDropEnded()}
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView)->Void)?, _ view: UIView) {if let m = method {m(view)}}
    
    // MARK: Internal Variables
    var animatingView: UIView?
    
    struct Key {
        static var acceptDropAnimation: String {return "dropped.view.zoom.out"}
        static var viewFrame: String {return "view.frame"}
    }
}
