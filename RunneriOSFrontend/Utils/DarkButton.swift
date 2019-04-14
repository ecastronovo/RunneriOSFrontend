//
//  DarkButton.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 4/14/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import Foundation

@IBDesignable
class DarkButton: UIButton {
    var borderWidth = 2.0
    var boderColor = UIColor.whiteColor().CGColor
    @IBInspectable
    var titleText: String? {
        didSet {
            self.setTitle(titleText, forState: .Normal)
            self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(aDecoder: NSCoder) {
        super.init(aDecoder: aDecoder)
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}
