//
//  EditorToolbar.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//

import SwiftUI

struct EditorToolbar: View {
    
    @Bindable var viewModel: DrawingViewModel
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 0) {
                Button(action: viewModel.undo) {
                    Image(systemName: "arrow.uturn.backward")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .padding(.leading, 8)
                        .foregroundColor(viewModel.isUndoAvailable ? Color("TextColor") : Color("TextColor").opacity(0.6))
                }
                
                Button(action: viewModel.redo) {
                    Image(systemName: "arrow.uturn.forward")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .padding(.leading, 8)
                        .foregroundColor(viewModel.isRedoAvailable ? Color("TextColor") : Color("TextColor").opacity(0.6))
                }
                
                Spacer()
                
                if isEditing {
                    TextField("", text: $viewModel.title)
                        .textFieldStyle(.plain)
                        .frame(width: 160)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .kerning(-1.4)
                        .foregroundStyle(.white)
                        .background(.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .onSubmit {
                            if !viewModel.title.isEmpty {
                                isEditing = false
                            }
                        }
                } else {
                    Text(viewModel.title)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .kerning(-1.4)
                        .foregroundStyle(.white)
                        .onTapGesture {
                            isEditing = true
                        }
                }
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(viewModel.selectedColor)
                    .padding(2)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color("DialogSurface"))
                            .stroke(.white.opacity(0.5), lineWidth: 0.5)
                    }
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 8)

                Picker("", selection: $viewModel.selectedLineWidth) {
                    ForEach([2, 4, 6, 8, 12, 14, 16, 18, 20], id: \.self) { size in
                        Text("\(size)")
                            .tag(CGFloat(size))
                    }
                }
                .tint(Color("TextColor"))
                .pickerStyle(.menu)
                .frame(width: 64, height: 32)
                .background {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color("DialogSurface"))
                        .stroke(.white.opacity(0.5), lineWidth: 0.5)
                }
            }
        }
        .padding(8)
    }
}

#Preview {
    EditorToolbar(viewModel: DrawingViewModel())
        .background(.black)
}
