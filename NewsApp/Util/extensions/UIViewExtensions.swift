//
//  UIViewExtensions.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 12/31/21.
//

import UIKit

extension UIView {
    @objc func startLoadingAnimation(scale: CGFloat = 0.6) {
        self.stopLoadingAnimation()
        
        DispatchQueue.main.async {
            let activityIndicatorView: UIActivityIndicatorView = {
                let indicator = UIActivityIndicatorView()
                if #available(iOS 13.0, *) {
                    indicator.style = .large
                }
                indicator.color = Colors.COLOR_ACCENT
                indicator.startAnimating()
                indicator.autoresizingMask = [
                    .flexibleLeftMargin,
                    .flexibleRightMargin,
                    .flexibleTopMargin,
                    .flexibleBottomMargin
                ]
                indicator.tag = 91001901901
                indicator.translatesAutoresizingMaskIntoConstraints = true
                indicator.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
                indicator.scale(factor: scale)
                return indicator
            }()
            
            self.insertSubview(activityIndicatorView, at: 0)
            if(!activityIndicatorView.isAnimating) {
                activityIndicatorView.startAnimating()
            }
        }
    }
    
    @objc func stopLoadingAnimation(){
        DispatchQueue.main.async {
            if let activityIndicatorView = (self.viewWithTag(91001901901) as? UIActivityIndicatorView){
                if(activityIndicatorView.isAnimating){
                    activityIndicatorView.isHidden = true
                    activityIndicatorView.removeFromSuperview()
                    activityIndicatorView.stopAnimating()
                }
            }
        }
        
    }
}
