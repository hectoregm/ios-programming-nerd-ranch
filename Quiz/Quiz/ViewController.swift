//
//  ViewController.swift
//  Quiz
//
//  Created by Hector Enrique Gomez Morales on 1/5/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var currentQuestionLabel: UILabel!
  @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
  @IBOutlet var nextQuestionLabel: UILabel!
  @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
  @IBOutlet var answerLabel: UILabel!

  let questions: [String] = ["From what is cognac made ?",
    "What is 7+7 ?",
    "What is the capital of Vermont ?"]

  let answers: [String] = ["Grapes",
    "14",
    "Montpelier"]
  var currentQuestionIndex: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    currentQuestionLabel.text = questions[currentQuestionIndex]

    updateOffScreenLabel()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    nextQuestionLabel.alpha = 0
  }

  @IBAction func showNextQuestion(sender: AnyObject) {
    ++currentQuestionIndex
    if currentQuestionIndex == questions.count {
      currentQuestionIndex = 0
    }

    let question: String = questions[currentQuestionIndex]
    nextQuestionLabel.text = question
    answerLabel.text = "???"

    animateLabelTransitions()
  }

  @IBAction func showAnswer(sender: AnyObject) {
    let answer: String = answers[currentQuestionIndex]
    answerLabel.text = answer
  }

  func updateOffScreenLabel() {
    let screenWidth = view.frame.width
    nextQuestionLabelCenterXConstraint.constant = -screenWidth
  }

  func animateLabelTransitions() {
    view.layoutIfNeeded()

    let screenWidth = view.frame.width
    self.nextQuestionLabelCenterXConstraint.constant = 0
    self.currentQuestionLabelCenterXConstraint.constant += screenWidth

    UIView.animateWithDuration(0.5, delay: 0,
      options: [.CurveLinear],
      animations: {
        self.currentQuestionLabel.alpha = 0
        self.nextQuestionLabel.alpha = 1

        self.view.layoutIfNeeded()
      }, completion: { _ in
        swap(&self.currentQuestionLabel,
             &self.nextQuestionLabel)
        swap(&self.currentQuestionLabelCenterXConstraint,
             &self.nextQuestionLabelCenterXConstraint)

        self.updateOffScreenLabel()
    })
  }
}

