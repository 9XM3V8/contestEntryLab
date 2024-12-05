//
//  ViewController.swift
//  Contest
//
//  Created by Dylan on 12/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, isValidEmail(email) else {
            shakeTextField()
            return
        }
        print("Valid email: \(email)")
        performSegue(withIdentifier: "SubmitSegue", sender: submitButton)
    }

    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@")
    }

    func shakeTextField() {
        let shakeAnimation = CGAffineTransform(translationX: 5, y: 0)
        let leftShakeAnimation = CGAffineTransform(translationX: -5, y: 0)

        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.emailTextField.transform = shakeAnimation
            }
        ) { _ in
            UIView.animate(
                withDuration: 0.05,
                animations: {
                    self.emailTextField.transform = CGAffineTransform.identity
                }
            ) { _ in
                UIView.animate(
                    withDuration: 0.05,
                    animations: {
                        self.emailTextField.transform = leftShakeAnimation
                    }
                ) { _ in
                    UIView.animate(
                        withDuration: 0.05,
                        animations: {
                            self.emailTextField.transform =
                                CGAffineTransform.identity
                        })
                }
            }
        }
    }
}
