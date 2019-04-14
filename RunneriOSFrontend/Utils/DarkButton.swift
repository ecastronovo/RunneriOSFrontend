//
//  DarkButton.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/14/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import UIKit

class DarkButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
        
    }
    
    
    func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        
        backgroundColor      = UIColor.blue
        titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = 15
        layer.borderWidth    = 3.0
        layer.borderColor    = UIColor.darkGray.cgColor
        
        
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
}
//
//@IBDesignable
//class DarkButton: UIButton {
//    var borderWidth = 2.0
//    var boderColor = UIColor.whiteColor().CGColor
//    @IBInspectable
//    var titleText: String? {
//        didSet {
//            self.setTitle(titleText, forState: .Normal)
//            self.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        }
//    }
//
//    override init(frame: CGRect){
//        super.init(frame: frame)
//    }
//
//    required init?(aDecoder: NSCoder) {
//        super.init(aDecoder: aDecoder)
//    }
//
//    override func layoutSubviews() {
//        setup()
//    }
//
//    func setup() {
//        self.clipsToBounds = true
//        self.layer.cornerRadius = self.frame.size.width / 2.0
//        self.layer.borderColor = borderColor
//        self.layer.borderWidth = borderWidth
//    }
//}
