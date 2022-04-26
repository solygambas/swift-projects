import SwiftUI
import PlaygroundSupport

//struct ContentView: View {
//    @State var count = 0
//
//    var body: some View {
//        VStack {
//            Button(action: { self.count += 1},
//                   label: {Text("Press here")
//                .padding()}
//        )
//            if count > 0 {
//                Text("The button has been pressed \(count) times.")
//            } else {
//                Text("The button has not been pressed.")
//            }
//        }
//    }
//}

//PlaygroundPage.current.setLiveView(ContentView())

//struct HuzzahView : View {
//    var body: some View {
//        Text("Huzzah")
//    }
//}
//
//PlaygroundPage.current.setLiveView(HuzzahView())

//struct ListView : View {
//    var body: some View {
//        List {
//            Text("Huzzah!")
//            Text("Hooray!")
//            Text("Amazing!")
//        }
//    }
//}
//
//PlaygroundPage.current.setLiveView(ListView())

//struct ContentView: View {
//    @State private var coffeeCount = 0
//    @State private var cocktailCount = 0
//    @State private var teaCount = 0
//
//    var body: some View {
//        VStack {
//            Button("☕ Coffee: \(coffeeCount)") { self.coffeeCount += 1}
//            Button("🍸 Cocktail: \(cocktailCount)") {
//            self.cocktailCount += 1}
//            Button("🍵 Tea: \(teaCount)") { self.teaCount += 1}
//        }
//    }
//}
//
//PlaygroundPage.current.setLiveView(ContentView())

struct SliderView: View {
    @State private var sliderValue = 0.0

    var body: some View {
        VStack {
            Text("Converter")
                .font(.headline)
                .foregroundColor(.red)
                .background(Color.green)
                .padding()
                .background(Color.gray)
            Slider(value: $sliderValue, in: 1...100, step: 1)
            Text("\(sliderValue, specifier: "%.2f") inches is \(sliderValue * 2.54, specifier: "%.2f") centimeters")
        }
    }
}

PlaygroundPage.current.setLiveView(SliderView())
