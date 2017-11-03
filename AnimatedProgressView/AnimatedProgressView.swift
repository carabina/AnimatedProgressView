//
//  AnimatedProgressView.swift
//  AnimatedProgressView
//
//  Created by Дима on 03.11.2017.
//  Copyright © 2017 Дима. All rights reserved.
//

import Foundation
import UIKit

class BeautifulProgressBar: UIView {
    
    private var indicatorView: UIView? = UIView()
    
    var indicatorColor: UIColor?{
        get{
            return self.indicatorColor
        }
        set{
            self.indicatorView?.backgroundColor = newValue
        }
    }
    
    var isAnimating: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.indicatorView = UIView()
        self.setUpIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.indicatorView = UIView()
        self.setUpIndicatorView()
        
    }
    
    convenience init(backgroundColor: UIColor, indicatorColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
        self.indicatorColor = indicatorColor
    }
    
    private func setUpIndicatorView(){
        self.indicatorColor = self.tintColor
        self.indicatorView?.translatesAutoresizingMaskIntoConstraints = false
        if let indicatorView = self.indicatorView{
            self.addConstraints([
                NSLayoutConstraint(item: indicatorView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: indicatorView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: indicatorView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: indicatorView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 0),
                ])
            self.addSubview(self.indicatorView!)
        }
    }
    
    func startAnimation(with timeInterval: TimeInterval = 1){
        if !self.isAnimating{
            self.isAnimating = true
            self.animate(with: timeInterval)
        }
    }
    
    func stopAnimation(){
        if self.isAnimating {
            self.isAnimating = false
        }
    }
    
    private func animate(with timeInterval: TimeInterval = 1) {
        let option = UIViewAnimationOptions.curveLinear
        UIView.animate(withDuration: timeInterval*0.4, delay: timeInterval*0.1, options: option, animations: {
            //1-st step
            self.indicatorView?.frame.size.width += self.frame.size.width * 0.75
        },
                       completion: {_ in
                        UIView.animate(withDuration: timeInterval*0.2, delay: 0, options: option, animations: {
                            //2-nd step
                            self.indicatorView?.frame.origin.x += self.frame.size.width*0.25
                            self.indicatorView?.frame.size.width -= self.frame.size.width*0.125
                        },
                                       completion: {_ in
                                        UIView.animate(withDuration: timeInterval*0.3, delay: 0, options: option, animations: {
                                            //3-rd step
                                            self.indicatorView?.frame.size.width = 0
                                            self.indicatorView?.frame.origin.x = self.frame.size.width
                                        },
                                                       completion: {_ in
                                                        //completion
                                                        self.indicatorView?.frame.origin.x = 0
                                                        if self.isAnimating{
                                                            self.animate(with: timeInterval)
                                                        }
                                        })
                        })
        })
    }
}
