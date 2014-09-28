//
//  UIView+Subviews.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/25/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


extension UIView {
    
    public func maybeAddSubview(view: UIView?) {if let v = view {addSubview(v)}}

    public func logViewHierarchy() {walkViewHierarchy({v in println("\(v.addressString()) \(v.tagString()) - \(v.frame) \(v.superviewString())")})}
    public func addressString() -> String {return NSString(format: "<%p>", self)}
    public func tagString() -> String {return NSString(format: "(%03d)", self.tag)}
    public func superviewString() -> String {if let parentView = superview {return parentView.addressString()} else {return ""}}
}