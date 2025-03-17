//
//  TextEditorStyleModifier.swift
//  YNoteView
//
//  Created by YZ on 2.01.2025.
//

import SwiftUICore

struct TextEditorStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .foregroundColor(.black)
            .tint(.black)
            .font(.system(size: 16))
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .scrollContentBackground(.hidden)
    }
}

extension View {
    func customTextEditorStyle() -> some View {
        self.modifier(TextEditorStyleModifier())
    }
}
