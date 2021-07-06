//
//  ContentView.swift
//  Shared
//
//  Created by Marconi Gomes on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = 50.0
    @State private var isPopupVisible = false
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Button(action: {
                self.game.resetTargetValue()
            }) {
                Image(systemName: "gobackward")
                    .font(.largeTitle)
            }
            .padding()
            VStack {
                Text("PUT THE SLIDER AS CLOSE AS YOU CAN TO THE VALUE")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.callout)
                    .autocapitalization(.allCharacters)
                HStack {
                    Text("🎯").font(.largeTitle)
                    Text(String(game.targetValue))
                        .fontWeight(.black)
                        .font(.largeTitle)
                        .kerning(-1.0)
                        .padding(.vertical, 10.0)
                    Text("🎯").font(.largeTitle)
                }
                HStack {
                    Text("1")
                        .bold()
                        .font(.headline)
                    Slider(value: self.$sliderValue, in: 1.0...100.0)
                        .accentColor(.red)
                    Text("100")
                        .bold()
                        .font(.headline)
                }
                Button(action: {
                    self.isPopupVisible = true
                }) {
                    Text("Hit it")
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 10.0)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(lineWidth: 2))
                }
                .alert(isPresented: $isPopupVisible, content: {
                    let roundedValue = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Results"), message: Text("You got: \(roundedValue)\n" + "and scored: \(game.calculateScore(sliderValue: roundedValue))"), dismissButton: .default(Text("Yay! :)")))
                })
            }.padding(.horizontal, 15.0)
            HStack {
                Text("Round: \(game.round)")
                Text("Score: \(game.score)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
