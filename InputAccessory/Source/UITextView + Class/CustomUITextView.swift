//
//  CustomUITextView.swift
//  Kaksha
//
//  Created by Raghav Ahuja on 12/23/18.
//  Copyright © 2018 Raghav Ahuja. All rights reserved.
//

import UIKit

@IBDesignable class CustomUITextView: UITextView {
    
    @IBInspectable var placeholderColor: UIColor = .placeholder
    @IBInspectable var placeholder: String = ""
    
    override var font: UIFont? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var contentInset: UIEdgeInsets {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var textContainerInset: UIEdgeInsets {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var textAlignment: NSTextAlignment {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var text: String! {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var attributedText: NSAttributedString? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        font = UIFont.preferredFont(forTextStyle: .body)
        // hide / show placeholder string depending upon text in textView
        NotificationCenter.default.addObserver(forName: UITextView.textDidChangeNotification, object: nil, queue: .main) { [weak self] (notification) in
            self?.setNeedsDisplay()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Calculates the bounds for placeholder
    ///
    /// - Parameter bounds: given bounds in which the placeholder will fit
    /// - Returns: bounds for placeholder
    private func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        var x = textContainerInset.left + 4.0
        var y = contentInset.top  + 8.0
        let w = frame.size.width - textContainerInset.left - textContainerInset.right - 16.0
        let h = frame.size.height - contentInset.top - contentInset.bottom - 16.0
        
        if let style = typingAttributes[.paragraphStyle] as? NSParagraphStyle {
            x += style.headIndent
            y += style.firstLineHeadIndent
        }
        return CGRect(x: x, y: y, width: w, height: h)
    }
    
    override func draw(_ rect: CGRect) {
        if text.isEmpty && !placeholder.isEmpty {
            // Create a placeholder string using NSMutableParagraphStyle
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = textAlignment
            let attributes: [NSAttributedString.Key: Any] = [.font : font!, .foregroundColor : placeholderColor, .paragraphStyle  : paragraphStyle]
            
            // placeholder string draws in textView
            self.placeholder.draw(in: self.placeholderRectForBounds(bounds: self.bounds), withAttributes: attributes)
        }
        super.draw(rect)
    }
}
