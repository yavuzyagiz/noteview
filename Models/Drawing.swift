//
//  Drawing.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//

import CoreGraphics
import Foundation

class Drawing: Identifiable {
    var id: UUID
    var tool: DrawingTool
    var points: [CGPoint]
    
    init(tool: DrawingTool, points: [CGPoint] = []) {
        self.id = UUID()
        self.tool = tool
        self.points = points
    }
}
