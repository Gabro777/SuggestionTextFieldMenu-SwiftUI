//
//  ContentView.swift
//  SuggestionTextFieldMenu
//
//  Created by Gabriele Cusimano on 26/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var editing: Bool = false
    @State var inputText: String = ""
    @State var vOffset: CGFloat = 5
    @State var hOffset: CGFloat = 0
    
    var body: some View {
       
        VStack() {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                VStack(alignment: .center) {
                    
                    Spacer().frame(width: 0, height: 70, alignment: .topLeading)
                    
                    Text("Spacer")
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(14)
                        .padding(.horizontal, 20)
                        
                    
                    Spacer().frame(width: 0, height: 50, alignment: .topLeading)
                    
                   
                    Text("Textfield!")
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .leading)
                        .padding(.horizontal, 25)
                        
                }
                SuggestionTextFieldMenu(editing: $editing, text: $inputText, verticalOffset: vOffset, horizontalOffset: hOffset)
            }
            
            Group {
                TextField("Placeholder", text: $inputText, onEditingChanged: { edit in
                            self.editing = edit}).padding(.horizontal, 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
            .background(Color.init(red: 0.98, green: 0.98, blue: 0.98))
            .cornerRadius(14)
            .shadow(radius: 4)
            .padding(.horizontal, 20)
 
           
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
