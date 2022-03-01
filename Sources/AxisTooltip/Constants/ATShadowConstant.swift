//
//  ATShadowConstant.swift
//  AxisTooltip
//
//  Created by jasu on 2022/02/28.
//  Copyright (c) 2022 jasu All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import SwiftUI

/// Defines the shadow of the tooltip.
public struct ATShadowConstant: Equatable {
    
    public var color: Color
    public var radius: CGFloat
    public var x: CGFloat
    public var y: CGFloat
    
    /// Initializes `ATShadowConstant`
    /// - Parameters:
    ///   - color: The shadow's color. The default value is `.black.opacity(0.3)`.
    ///   - radius: The shadow's size. The default value is `3`.
    ///   - x: A horizontal offset you use to position the shadow relative to the tooltip. The default value is `0`.
    ///   - y: A vertical offset you use to position the shadow relative to the tooltip. The default value is `0`.
    public init(color: Color = .black.opacity(0.3),
                radius: CGFloat = 3,
                x: CGFloat = 0,
                y: CGFloat = 0) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}
