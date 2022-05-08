//
//  ContentView.swift
//  PandaMulti
//
// Created by Solygambas on 08/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct Question {
    var text: String
    var answer: Int
}

struct ContentView: View {
    @State private var isGameActive = false
    @State private var questions: [Question] = []
    @State private var questionNumber = 0
    @State private var upTo = 2
    @State private var questionTotal = 5
    @State private var answer = ""
    @State private var score = 0
    @State private var showResult = false
    
    var body: some View {
        VStack {
            if (!isGameActive) {
                Form {
                    Section {
                        Stepper("Up to... \(upTo)",
                        value: $upTo, in: 2...12, step: 1)
                    } header: {
                        Text("Which multiplication tables do you want to practice?").font(.headline)
                }
                    Section {
                        // add buttons
                        Stepper("Give me \(questionTotal) questions",
                        value: $questionTotal, in: 5...20, step: 5)
                    } header: {
                        Text("How many questions do you want?").font(.headline)
                }
                    Button("Let's play") {
                        generateQuestions()
                    }
                }
            } else {
                Form {
                    Section {
                        TextField("Answer", text: $answer)
                                                .keyboardType(.numberPad)
                        Button("Submit") {
                            handleAnswer()
                        }
                    } header: {
                        Text("\(questions[questionNumber].text)").font(.headline)
                }
                }
            }
        }
        .alert("Final score", isPresented: $showResult) {
                    Button("Restart", action: reset)
                } message: {
                    Text("Your final score is \(score)/\(questionTotal)")
                }
    }
    
    func generateQuestions() {
        for _ in 1...questionTotal {
            let num1 = Int.random(in: 1...upTo)
            let num2 = Int.random(in: 1...upTo)
            let question = Question(text: "\(num1) x \(num2)?", answer: num1 * num2)
            questions.append(question)
        }
        isGameActive = true
    }
    
    func handleAnswer() {
        if (questions[questionNumber].answer == Int(answer)) {
            score += 1
        }
        answer = ""
        print("\(questionNumber), \(questionTotal)")
        if (questionNumber < questionTotal - 1) {
            questionNumber += 1
        } else {
            showResult = true
        }
    }
        
    func reset() {
        score = 0
        questionNumber = 0
        questions = []
        isGameActive = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
