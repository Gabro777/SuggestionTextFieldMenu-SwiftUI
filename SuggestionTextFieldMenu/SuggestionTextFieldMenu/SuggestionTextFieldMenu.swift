//
//  SuggestionTextFieldMenu.swift
//  SuggestionTextFieldMenu
//
//  Created by Gabriele Cusimano on 26/08/21.
//

import SwiftUI

public struct SuggestionTextFieldMenu: View {
    
    @State var names: [String] = ["Apple","Peach","Orange","Banana", "Melon", "Watermelon","Mandarin","Mulberries","Lemon","Lime","Loquat","Longan","Lychee","Grape","Pear","Kiwi","Mango"]
    @Binding var editing: Bool
    @Binding var inputText: String
    @State var verticalOffset: CGFloat
    @State var horizontalOffset: CGFloat
    
    private var filteredTexts: Binding<[String]> { Binding (
        get: {
            return names.filter { $0.contains(inputText) && $0.prefix(1) == inputText.prefix(1) } },
        set: { _ in })
    }
    
    public init(editing: Binding<Bool>, text: Binding<String>) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = 0
        self.horizontalOffset = 0
    }
    
    public init(editing: Binding<Bool>, text: Binding<String>, verticalOffset: CGFloat, horizontalOffset: CGFloat) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = verticalOffset
        self.horizontalOffset = horizontalOffset
    }
    
    public var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(filteredTexts.wrappedValue, id: \.self) { textSearched in
                    
                    Text(textSearched)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 25)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: 50,
                               alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            inputText = textSearched
                            editing = false
                            self.endTextEditing()
                        })
                    Divider()
                        .padding(.horizontal, 10)
                }
            }
        }.background(Color.white)
        
        .cornerRadius(15)
        .foregroundColor(Color(.black))
        .ignoresSafeArea()
        .frame(maxWidth: .infinity,
               minHeight: 0,
               maxHeight: 50 * CGFloat( (filteredTexts.wrappedValue.count > 3 ? 3: filteredTexts.wrappedValue.count)))
        .shadow(radius: 4)
        .padding(.horizontal, 25)
        .offset(x: horizontalOffset, y: verticalOffset)
        .isHidden(!editing, remove: !editing)
        
    }
    
    
}


struct SuggestionTextFieldMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatefulPreviewWrapper("lemon") {text in
                VStack {
                    TextField("Title", text: text)
                    SuggestionTextFieldMenu(editing: .constant(true), text: text)
                }
                
            }
        }
        
    }
}
