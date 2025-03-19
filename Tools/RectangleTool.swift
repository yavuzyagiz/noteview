//
//  RectangleTool.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//

import SwiftUICore

struct RectangleTool: DrawingTool {
    var color: Color
    var lineWidth: CGFloat
    
    init(color: Color, lineWidth: CGFloat) {
        self.color = color
        self.lineWidth = lineWidth
    }
    
    func draw(context: GraphicsContext, points: [CGPoint]) {
        guard points.count >= 2 else { return }
        
        let start = points.first!
        let end = points.last!
        
        let rect = CGRect(
            x: min(start.x, end.x),
            y: min(start.y, end.y),
            width: abs(start.x - end.x),
            height: abs(start.y - end.y)
        )
        
        context.stroke(
            Path { path in
                path.addRect(rect)
            },
            with: .color(color),
            lineWidth: lineWidth
        )
    }
    
    func preview(context: GraphicsContext, points: [CGPoint]) {

    }
}
