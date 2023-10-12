//
//  ATConstant.swift
//  AxisTooltip
//
//  Created by jasu on 2022/02/27.
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

/// The position mode of the tooltip.
public enum ATAxisMode: Sendable {
    case top
    case bottom
    case leading
    case trailing
}

/// Defines the settings for the tooltip.
public struct ATConstant: Equatable {
    
    public var axisMode: ATAxisMode
    public var border: ATBorderConstant
    public var arrow: ATArrowConstant
    public var shadow: ATShadowConstant
    public var distance: CGFloat
    public var animation: Animation?
    
    /// Initializes `ATConstant`
    /// - Parameters:
    ///   - axisMode: The position mode of the tooltip.
    ///   - border: The definition of a border.
    ///   - arrow: The definition of arrow indication.
    ///   - shadow: Defines the shadow of the tooltip.
    ///   - distance: The distance between the view and the tooltip. The default value is `8`.
    ///   - animation: An animation of the tooltip. The default value is `.easeInOut(duration: 0.28)`.
    public init(axisMode: ATAxisMode = .bottom,
                border: ATBorderConstant = .init(),
                arrow: ATArrowConstant = .init(),
                shadow: ATShadowConstant = .init(),
                distance: CGFloat = 8,
                animation: Animation? = .easeInOut(duration: 0.28)) {
        self.axisMode = axisMode
        self.border = border
        self.arrow = arrow
        self.shadow = shadow
        self.distance = distance
        self.animation = animation
    }
}
