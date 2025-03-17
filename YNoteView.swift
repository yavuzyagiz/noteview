//
//  YNoteView.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//

import SwiftUI

struct YNoteView: View {
    @State private var viewModel: DrawingViewModel = DrawingViewModel()
    var menuBackgroundColor: Color = .black
    
    var body: some View {
        VStack(spacing: 0) {
            ToolMenu(viewModel: viewModel, backgroundColor: menuBackgroundColor)
            ScrollViewReader { ScrollViewProxy in
                ScrollView {
                    ZStack {
                        Canvas { context, size in
                            viewModel.update(context: context)
                        }
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    viewModel.continueDrawing(point: value.location)
                                }
                                .onEnded { _ in
                                    viewModel.endDrawing()
                                }
                        )
                        
                        TextEditor(text: $viewModel.text)
                            .customTextEditorStyle()
                            .disabled(viewModel.selectedTool != nil)
                            .id("textEditor")
                    }
                    .frame(minHeight: 800)
                }
            }
        }
        .frame(maxHeight: .infinity)
        .background(.white)
    }
}

#Preview {
    YNoteView()
}
