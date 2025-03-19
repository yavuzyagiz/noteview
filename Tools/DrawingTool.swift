//
//  DrawingTool.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//

import SwiftUICore

protocol DrawingTool {
    var color: Color { get set }
    var lineWidth: CGFloat { get set }
    
    func draw(context: GraphicsContext, points: [CGPoint])
    func preview(context: GraphicsContext, points: [CGPoint])
}
