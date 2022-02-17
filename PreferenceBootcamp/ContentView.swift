//
//  ContentView.swift
//  PreferenceBootcamp
//
//  Created by shehan karunarathna on 2022-02-17.
//

import SwiftUI

struct ContentView: View {
    @State var text:String = "Hello rld"
    var body: some View {
        NavigationView{
            SecondView(text: text)
                .padding()
                .navigationTitle("Navigation Title")
               
                
        }
        .onPreferenceChange(CUSTitlePreference.self, perform: { value in
            self.text = value
        })
       
       
       
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct SecondView: View {
     let text:String
    @State var newValue = ""
    var body: some View {
        Text(text)
            .onAppear {
                getdata()
            }
            .customTitle(text: newValue)
           
           
    }
    
    func getdata() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "new value from db"
        }
    }
}
struct CUSTitlePreference: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}


extension View{
    func customTitle(text:String) ->  some View{
        preference(key: CUSTitlePreference.self, value: text)
    }
}
