# SuggestionTextFieldMenu-SwiftUI
My project about a suggestion field in swiftUI

This is how it looks like!

![ezgif com-video-to-gif-2](https://user-images.githubusercontent.com/89965384/131913428-a17f6679-75d7-4096-bb05-9114a14e8743.gif)



You can fill an array of objects and decide how many lines you want to show. I decided to show just max 3 lines and reduce them one by one through the filter. 

So let's start from the begin!


First of all i created a struct that will contains my universal component.
Declare the variables that you need, in this case i declared these:

    @Binding var editing: Bool
    
    @Binding var inputText: String
    
    @State var verticalOffset: CGFloat
    
     @State var names: [String] = []
     
    @State var horizontalOffset: CGFloat
    

