//
//  Extention.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

// Custom Constraint extention
extension UIView {
    // Fill the superview
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    // Set width and height anchors
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    func viewWidth(width: CGSize = .zero) {
        widthAnchor.constraint(equalToConstant: width.width).isActive = true
    }
    
    func viewHeight(height: CGSize = .zero) {
        widthAnchor.constraint(equalToConstant: height.height).isActive = true
    }
    
    func viewConstantRatio(widthToHeightRatio: Float, width: CGSize = .zero) {
        widthAnchor.constraint(equalToConstant: width.width).isActive = true
        heightAnchor.constraint(equalToConstant: width.width * CGFloat(widthToHeightRatio)).isActive = true
    }
    
    // Pretty much all the constraints imaginable
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        // Unwrapping optinals
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
            
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
            
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom , constant: -padding.bottom).isActive = true
            
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
            
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    // Set the object to be horizontally centered with another view
    func centerHorizontalOfView(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    // Set the object to be veritically centered with another view
    func centerVerticalOfView(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    // Center a view to another view
    func centerOfView(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Double {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

// Extention to check the root view controller at the given moment to avoid errors.
extension UIResponder {
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}
