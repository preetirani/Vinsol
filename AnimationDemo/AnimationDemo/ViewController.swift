//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Rani on 2/2/18.
//  Copyright © 2018 rani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var commentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // Tracks all running animators
    var runningAnimators = [UIViewPropertyAnimator]()

    private var initialCenter = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture()

    }
    
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.movingCommentView(_:)))
        commentView.addGestureRecognizer(panGesture)
    }
    
    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let piece = gestureRecognizer.view else {
            return
        }
        
//        switch gestureRecognizer.state {
//        case .began:
//
//        default:
//            return
//        }
    }
    
    @objc func movingCommentView(_ gestureRecognizer : UIPanGestureRecognizer) {
        guard let piece = gestureRecognizer.view else {
            return
        }
        
        let translation = gestureRecognizer.translation(in: piece.superview)
        print("translation : \(translation.y)")
        print("commentview : \(commentView.frame.origin.y)")
        if gestureRecognizer.state == .began {
            initialCenter = piece.center
        }
        
        let velocity = gestureRecognizer.velocity(in: piece.superview)
        
        if gestureRecognizer.state != .cancelled {
            var animation: UIViewAnimationCurve = .easeIn
            var alpha: CGFloat!
            var radius: CGFloat!
            var maxY: CGFloat!
            
            if velocity.y > 0 {
                animation = .easeIn
                alpha = 0.1
                radius = 0
                maxY = 500
                //origin.y > 500 true
            } else {
                animation = .easeOut
                alpha = 1
                radius = 10
                maxY = 100
                // origin.y > 100 true
            }
                let animator = UIViewPropertyAnimator(duration: 0.3, curve: animation) {
                    piece.center = CGPoint(x: self.initialCenter.x, y: self.initialCenter.y + translation.y)
                }
                
                animator.startAnimation()
                
                let alphaAnimator = UIViewPropertyAnimator(duration: 5, curve: animation) {
                    //                self.overlay.alpha = alpha
                }
                alphaAnimator.startAnimation()
                
            let radiusAnimator = UIViewPropertyAnimator(duration: 5, curve: animation) {
                self.commentView.layer.cornerRadius = radius
            }
            radiusAnimator.startAnimation()
            
                let labelAnimator = UIViewPropertyAnimator(duration: 5, controlPoint1: initialCenter, controlPoint2: translation, animations: {
                    self.commentView.layer.cornerRadius = radius
                })
                labelAnimator.startAnimation()
//            if commentView.frame.origin.y > maxY {
//                animator.pauseAnimation()
//
//                alphaAnimator.pauseAnimation()
//                labelAnimator.pauseAnimation()
//            }
            
        } else {
            //piece.center = initialCenter
        }
    }
}

extension ViewController {

    // Perform all animations with animators if not already running
    func animateTransitionIfNeeded(state: State, duration: TimeInterval) {
        if runningAnimators.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
                self.commentView.frame = CGRect()
            })
        }
    }
    
    // Starts transition if necessary or reverses it on tap
    func animateOrReverseRunningTransition(state: State, duration: TimeInterval) {
        
    }
    
    // Starts transition if necessary and pauses on pan .begin
    func startInteractiveTransition(state: State, duration: TimeInterval) {
        
    }
    
    // Scrubs transition on pan .changed
    func updateInteractiveTransition(fractionComplete: CGFloat) {
        
    }
    
    // Continues or reverse transition on pan .ended
    func continueInteractiveTransition(cancel: Bool) {
        
    }
}

extension ViewController {
    enum State {
        case expanded
        case collapsed
    }
}
