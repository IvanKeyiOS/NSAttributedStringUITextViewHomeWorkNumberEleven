//
//  ViewController.swift
//  UITextView
//
//  Created by Иван Курганский on 28/07/2023.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet private weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        textView.delegate = self
    }
    
    private func setupTextView() {
        let text = "Swift — это фантастический способ писать приложения для телефонов, для десктопных компьютеров, серверов, да и чего-либо еще, что запускает и работает при помощи кода. Swift — безопасный, быстрый и интерактивный язык программирования. Swift вобрал в себя лучшие идеи современных языков с мудростью инженерной культуры Apple. Компилятор оптимизирован для производительности, а язык оптимизирован для разработки, без компромиссов с одной или другой стороны. Swift дружелюбен по отношению к новичкам в программировании. Это первый язык программирования промышленного качества, который так же понятен и увлекателен, как скриптовый язык. Написание кода в песочнице позволяет экспериментировать с кодом Swift и видеть результат мгновенно, без необходимости компилировать и запускать приложение.                                                                https://developer.apple.com/swift/ "
        
        let myURLString = "https://developer.apple.com/swift/"
        let attributedText = NSMutableAttributedString(string: text)
        
        if let range = text.range(of: myURLString) {
            let nsRange = NSRange(range, in: text)
            attributedText.addAttribute(.font, value:  UIFont.boldSystemFont(ofSize: 20), range: nsRange)
            
            attributedText.addAttribute(.link, value: myURLString, range: nsRange)
        }
        
        textView.attributedText = attributedText
        textView.isEditable = false
        textView.isSelectable = true
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        return false
    }
}


