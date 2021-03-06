//
//  TextField.swift
//  utair
//
//  Created by Anton Dryakhlykh on 31.03.17.
//  Copyright © 2017 teedee. All rights reserved.
//

import UIKit

@IBDesignable
class TextField: UITextField {
    
    // MARK: Properties
    
    var viewBackgroundColor: UIColor { return .clear }
    var textFont: UIFont { return UIFont.systemFont(ofSize: 17) }
    var placeholderColor: UIColor { return .gray }
    var placeholderFont: UIFont { return UIFont.systemFont(ofSize: 17) }
    var elementsColor: UIColor { return .white }
    var alignment: NSTextAlignment { return .left }
    var fontColor: UIColor { return .white }
    var padding: UIEdgeInsets { return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
    var cornerRadius: CGFloat { return 0.0 }
    var masksToBounds: Bool { return false }
    var separatorHeight: CGFloat { return 0.0 }
    
    override var placeholder: String? { didSet { applyStyle() } }
    
    // MARK: Initialization and deinitialization
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }
    
    // MARK: NSObject UIKit Additions
    
    override func prepareForInterfaceBuilder() { applyStyle() }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // MARK: Private Helpers
    
    private func applyStyle() {
        autocorrectionType = .no
        backgroundColor = viewBackgroundColor
        textColor = fontColor
        borderStyle = .none
        font = textFont
        if let placeholder = placeholder {
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): placeholderColor, convertFromNSAttributedStringKey(NSAttributedString.Key.font): placeholderFont]))
        }
        tintColor = elementsColor
        textAlignment = alignment
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = masksToBounds
        initSeparator()
    }
    
    private func initSeparator() {
        let separatorTopPadding = CGFloat(0)
        let separator = UIView(frame: CGRect(
            x: separatorTopPadding,
            y: frame.height - separatorHeight,
            width: frame.width,
            height: separatorHeight
        ))
        separator.backgroundColor = elementsColor
        addSubview(separator)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
