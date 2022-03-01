//
//  ATBorderConstant.swift
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

/// The definition of a border.
public struct ATBorderConstant: Equatable {
    
    public var radius: CGFloat
    public var lineWidth: CGFloat
    public var color: Color
    public var style: StrokeStyle?
    
    /// Initializes `ATBorderConstant`
    /// - Parameters:
    ///   - radius: The corner radius of the rectangle. The default value is `10`.
    ///   - lineWidth: The width of the stroke that outlines this shape. The default value is `2`.
    ///   - color: The color of the line. The default value is `.white.opacity(0.1)`.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///   whether the stroke is dashed --- that determine how to render this shape. The default value is `nil`.
    public init(radius: CGFloat = 10,
                lineWidth: CGFloat = 2,
                color: Color = .white.opacity(0.1),
                style: StrokeStyle? = nil) {
        self.radius = radius
        self.lineWidth = lineWidth
        self.color = color
        self.style = style
    }
}
