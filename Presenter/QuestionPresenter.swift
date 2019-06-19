//
//  QuestionPresenter.swift
//  kokoroAppiOS
//
//  Created by 中野湧仁 on 2019/06/17.
//  Copyright © 2019 中野湧仁. All rights reserved.
//
import Foundation
import FirebaseFirestore


protocol QuestionPresenterInput {
    func fetchQuestionData()
    func fetchResultData()
}

protocol QuestionPresenterOutput: AnyObject {
    func giveQuestionText(questionText: String)
}


final class QuestionPresenter {
    
    private weak var view: QuestionPresenterOutput?
    
    init(view: QuestionPresenterOutput) {
        self.view = view
    }
    
}


extension QuestionPresenter: QuestionPresenterInput {
    func fetchResultData() {
        
    }
    
    func fetchQuestionData(){
        let db = Firestore.firestore()
        db.collection("Questions")
            .document(generateRandomNumber().description)
            .getDocument { document, error in
                if let err = error {
                    print(err)
                } else {
                    guard let text = document?.data()?["title"] as? String else { return }
                    print(document?.data()!)
                    self.view?.giveQuestionText(questionText: text)
                }
        }
    }
}

extension QuestionPresenter {
    func generateRandomNumber() -> Int {
        let number = Int.random(in: 0..<10)
            return number
    }
}
