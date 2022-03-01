//
//  TooltipShape.swift
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

/// The shape of the tooltip.
struct TooltipShape: InsettableShape {

    let axisMode: ATAxisMode
    let cornerRadius: CGFloat
    let arrowWidth: CGFloat
    let arrowHeight: CGFloat
    
    var arrowPosition: CGFloat
    var amount: CGFloat = 0
    
    var animatableData: CGFloat {
        get { arrowPosition }
        set {
            arrowPosition = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        switch axisMode {
        case .top:          return arrowBottom(rect.size)
        case .bottom:       return arrowTop(rect.size)
        case .leading:      return arrowTrailing(rect.size)
        case .trailing:     return arrowLeading(rect.size)
        }
    }
    
    private func arrowTop(_ size: CGSize) -> Path {
        var path = Path()

        let x = limitX(size.width)
        path.move(to: CGPoint(x: x - arrowWidth , y: 0))
        path.addLine(to: CGPoint(x: x , y: -arrowHeight))
        path.addLine(to: CGPoint(x: x + arrowWidth , y: 0))
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)

        path.addArc(center: CGPoint(x: cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius, startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        
        path.closeSubpath()
        return path
    }
    
    private func arrowBottom(_ size: CGSize) -> Path {
        var path = Path()

        let x = limitX(size.width)

        path.move(to: CGPoint(x: cornerRadius , y: 0))
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: x + arrowWidth , y: size.height))
        path.addLine(to: CGPoint(x: x, y: size.height + arrowHeight))
        path.addLine(to: CGPoint(x: x - arrowWidth , y: size.height))
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius, startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        path.closeSubpath()
        return path
    }
    
    private func arrowLeading(_ size: CGSize) -> Path {
        var path = Path()

        let y = limitY(size.height)

        path.move(to: CGPoint(x: cornerRadius , y: 0))
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius, startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addLine(to: CGPoint(x: 0 , y: y + arrowWidth))
        path.addLine(to: CGPoint(x: 0 - arrowHeight, y: y))
        path.addLine(to: CGPoint(x: 0 , y: y - arrowWidth))
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        path.closeSubpath()
        return path
    }
    
    private func arrowTrailing(_ size: CGSize) -> Path {
        var path = Path()

        let y = limitY(size.height)

        path.move(to: CGPoint(x: cornerRadius , y: 0))
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: size.width , y: y - arrowWidth))
        path.addLine(to: CGPoint(x: size.width + arrowHeight, y: y))
        path.addLine(to: CGPoint(x: size.width , y: y + arrowWidth))
        path.addArc(center: CGPoint(x: size.width - cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: size.height - cornerRadius + amount),
                    radius: cornerRadius, startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addArc(center: CGPoint(x: cornerRadius + amount, y: cornerRadius + amount),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        path.closeSubpath()
        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.amount += amount
        return shape
    }
    
    private func limitX(_ w: CGFloat) -> CGFloat {
        var x = arrowPosition
        let cornerArrowWidth = cornerRadius + arrowWidth
        if arrowPosition >= (w - cornerArrowWidth) {
            x = w - cornerArrowWidth
        }else if arrowPosition <= cornerArrowWidth {
            x = cornerArrowWidth
        }
        return x
    }
    
    private func limitY(_ h: CGFloat) -> CGFloat {
        var y = arrowPosition
        let cornerArrowWidth = cornerRadius + arrowWidth
        if arrowPosition >= (h - cornerArrowWidth) {
            y = h - cornerArrowWidth
        }else if arrowPosition <= cornerArrowWidth {
            y = cornerArrowWidth
        }
        return y
    }

}

struct TooltipShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TooltipShape(axisMode: .leading, cornerRadius: 30, arrowWidth: 20, arrowHeight: 20, arrowPosition: 120)
                .stroke()
                .font(.callout)
                .padding()
                .frame(width: 200)
            Spacer()
            TooltipShape(axisMode: .trailing, cornerRadius: 60, arrowWidth: 20, arrowHeight: 20, arrowPosition: 0)
                .stroke()
                .fill(Color.blue)
                .frame(width: 260, height: 260)
        }
    }
}
