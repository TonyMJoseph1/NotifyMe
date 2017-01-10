//
//  NotifyButton.swift
//  Notify
//
//  Created by Tony M Joseph on 01/12/16.
//  Copyright © 2016 com.qburst.test. All rights reserved.
//

import UIKit

public enum Result {
    case success
    case failure
}

public class NotifyMe: UIButton, UITextFieldDelegate {
    public var notifyUser: CompletionMethod?
    var  sendButton = UIButton()
    public var  emailTextField = UITextField()
    var buttonClicked: Bool = false
    var buttonTitleColor = UIColor()
    var buttonFontSize = CGFloat()
    let initialButtonTitle: String = "Notify Me"
    let successButtonTitle: String = "Thank You!"
    let textFieldPlaceHolderValue: String = "E-mail"
    let sendButtonTitle: String = "Send"
    let retryButtonTitle: String = "Retry"
    let emailCheck: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let predicateFormat: String = "SELF MATCHES %@"
    let widthChangeConstant: CGFloat = 100
    @IBInspectable open var errorColor: UIColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    @IBInspectable open var borderColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    public typealias CompletionMethod = (NotifyMe) -> Void
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCommon()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCommon()
    }
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupCommon()
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.midY
        layer.borderWidth = 1
    }
    open func setupCommon() {
        // Set button properties and actions
        self.layoutIfNeeded()
        buttonTitleColor = self.currentTitleColor
        buttonFontSize = (self.titleLabel?.font.pointSize)!
        addTarget(self, action: #selector(NotifyMe.touchUpInside(_:)), for: .touchUpInside)
        setTitle(initialButtonTitle, for: UIControlState())
        setTitleColor(buttonTitleColor, for: UIControlState.normal)
        contentEdgeInsets = UIEdgeInsets(top: 0,
                                         left: 0,
                                         bottom: 0,
                                         right: 0)
        layer.borderColor = borderColor.cgColor
    }
    func touchUpInside(_ sender: NotifyMe) {
        //NotifyMe button clickaction
        if !self.buttonClicked {
            self.layer.borderColor = borderColor.cgColor
            self.buttonClicked = true
            self.titleLabel?.layer.opacity = 0.0
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.frame.size.width += self.widthChangeConstant
                self.frame.origin.x -= self.widthChangeConstant / 2
                self.setUpsendButton()
                self.setUpEmailTextField()
            }, completion: {(_:Bool) in
                self.addSubview(self.emailTextField)
                self.addSubview(self.sendButton)
                UIView.animate(withDuration: 0.1 ,
                               animations: {
                                self.sendButton.transform = CGAffineTransform(scaleX: 0, y: 0)
                },
                               completion: { _ in
                                UIView.animate(withDuration: 0.2) {
                                    self.sendButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                                }
                })
            })
        }
    }
    func sendButtonTapped() {
        self.notifyUser!(self)
    }
    open func complete(result: Result) {
        if result == .success {
            self.isEnabled = false
            self.setTitleColor(buttonTitleColor, for: UIControlState())
            self.setTitle(successButtonTitle, for: UIControlState())
        } else {
            self.isEnabled = true
            self.setTitleColor(errorColor, for: UIControlState())
            self.setTitle(retryButtonTitle, for: UIControlState())
            layer.borderColor = errorColor.cgColor
            self.buttonClicked = false
        }
        self.titleLabel?.layer.opacity = 0.0
        self.endTask()
    }
    open func fetchEmail(completion: @escaping CompletionMethod) {
        notifyUser = completion
    }

    func endTask() {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.sendButton.isHidden = true
            self.frame.size.width -= self.widthChangeConstant
            self.frame.origin.x += self.widthChangeConstant / 2
            self.emailTextField.removeFromSuperview()
            self.sendButton.removeFromSuperview()
            self.titleLabel?.layer.opacity = 1.0
            self.titleLabel?.font.withSize(0)
            }, completion: { _ in
                self.titleLabel?.font.withSize(self.buttonFontSize)
        })
    }
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = emailCheck
        let emailTest = NSPredicate(format:predicateFormat, emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    public func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
    }
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        emailTextField.endEditing(true)
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    @objc private func textFieldDidChange(textField: UITextField) {
        if isValidEmail(testStr: self.emailTextField.text!) {
            self.sendButton.isEnabled = true
            self.sendButton.setTitleColor(self.backgroundColor?.withAlphaComponent(1), for: UIControlState.normal)
        } else {
            self.sendButton.isEnabled = false
            self.sendButton.setTitleColor(self.backgroundColor?.withAlphaComponent(0.5), for: UIControlState.normal)
        }
    }
    func setUpsendButton() {
        self.sendButton  = UIButton(frame:CGRect(x :self.frame.size.width * 0.75 - 5, y :4,
                                                 width : self.frame.size.width/4, height :self.frame.size.height-8))
        self.sendButton.layer.cornerRadius  = self.sendButton.bounds.midY
        self.sendButton.addTarget(self, action: #selector(NotifyMe.sendButtonTapped), for: .touchUpInside)
        self.sendButton.setTitle(sendButtonTitle, for: UIControlState())
        self.sendButton.setTitleColor(self.backgroundColor?.withAlphaComponent(0.5), for: UIControlState.normal)
        self.sendButton.backgroundColor = buttonTitleColor
        self.sendButton.isEnabled = false
    }
    func setUpEmailTextField() {
        self.emailTextField = TextField (frame:CGRect(x :10, y :0,
                                        width : self.sendButton.frame.minX - 10, height :self.frame.size.height))
        self.emailTextField.delegate = self
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)),
                                      for: UIControlEvents.editingChanged)
        self.emailTextField.attributedPlaceholder = NSAttributedString(string:textFieldPlaceHolderValue,
                                        attributes:[NSForegroundColorAttributeName: buttonTitleColor])
        self.emailTextField.layer.cornerRadius = self.bounds.midY - 5
        self.emailTextField.backgroundColor = self.backgroundColor
        self.emailTextField.textColor = buttonTitleColor
    }
}
class TextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
