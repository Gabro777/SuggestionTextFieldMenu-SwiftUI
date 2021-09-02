//
//  Utility.swift
//  SuggestionTextFieldMenu
//
//  Created by Gabriele Cusimano on 26/08/21.
//

import SwiftUI
public extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}






//  StatefulPreviewWrapper.swift
//  SwiftUI Preview can't use @State variabiles, this wrapper let us easily use them.
//
//  Created by Jim Dovey on 10/11/19.
//  Copyright © 2019 Jim Dovey. All rights reserved.
//
//  Copied from https://developer.apple.com/forums/thread/118589?answerId=398579022#398579022

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    public var body: some View {
        content($value)
    }

    public init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
