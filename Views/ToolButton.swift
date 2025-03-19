//
//  ToolButton.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//


import SwiftUI

struct ToolButton: View {
    let item: ToolItem
    var selectedItem: ToolItem
    var size: CGFloat = 20
    var action: () -> Void = { }
    
    @State private var isPressed = false
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Button {
            action()
        } label: {
            VStack(alignment: .center, spacing: 0)
            {
                Image(systemName: item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(selectedItem == item ? .blue : Color("TextColor"))
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 0.3), value: scale)
            }
        }
        .id(item.id)
        .buttonStyle(.plain)
        .frame(width: 48, height: 48)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .background {
            RoundedRectangle(cornerRadius: 4)
                .fill(selectedItem == item ? Color("ButtonActiveSurface") : Color("ButtonSurface"))
                .stroke(.black, lineWidth: 1)
                .shadow(color: .black, radius: 0.5, y: selectedItem == item ? 0 : 1)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressed {
                        scale = 0.8
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    scale = 1.0
                    isPressed = false
                }
        )

    }
}

#Preview {
    ToolButton(item: .line, selectedItem: .line, action: { })
        .background(.white)
}
