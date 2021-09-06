# SuggestionTextFieldMenu-SwiftUI
My project about a suggestion field in swiftUI

This is how it looks like!

![ezgif com-video-to-gif-2](https://user-images.githubusercontent.com/89965384/131913428-a17f6679-75d7-4096-bb05-9114a14e8743.gif)


You can fill an array of objects and decide how many lines you want to show. I decided to show just a max of 3 lines and reduce them one by one through the filter. 

So let's start from the beginning!


First of all,  I created a struct that will contain my universal component.
Declare the variables that you need, in this case, I declared these:

    @Binding var editing: Bool
    
    @Binding var inputText: String
    
    @State var verticalOffset: CGFloat
    
    @State var names: [String] = []
     
    @State var horizontalOffset: CGFloat
    

after i decided to filter my array in that way:

    private var filteredTexts: Binding<[String]> { Binding (
        get: {
            return names.filter { $0.contains(inputText) && $0.prefix(1) == inputText.prefix(1) } },
        set: { _ in })
    }
    
I added an initializer with all that I need:
 
     public init(editing: Binding<Bool>, text: Binding<String>, verticalOffset: CGFloat, horizontalOffset: CGFloat) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = verticalOffset
        self.horizontalOffset = horizontalOffset
    }
    
    
And here the core part, inside the body Add in this order: ScrollView, LazyVStack, and a ForEach to handle the showing of the view
here's the code:
 
     ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filteredTexts.wrappedValue, id: \.self) { textSearched in
                        Text(textSearched)
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
            }.frame(maxWidth: .infinity,
               minHeight: 0,
               maxHeight: 50 * CGFloat( (filteredTexts.wrappedValue.count > 3 ? 3: filteredTexts.wrappedValue.count)))
    

Finally, to use this just add a ZStack and inside put SuggestionTextFieldMenu, based on the position, you can show it above or under a text field.
This method is not perfect, I tried to add a text field directly inside the universal component but when the small view comes up the entire view move. 
Please if you know how to reach that goal feel free to text me! Cheers
