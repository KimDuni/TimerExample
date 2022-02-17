//
//  ViewController.swift
//  TimerExample
//
//  Created by 성준 on 2022/02/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cntLabel: UILabel?
    @IBOutlet weak var timerButton: UIButton?
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private var cnt: Int = 0
    @IBAction func touchedStartTimer() {
        
        if timer != nil {
            stopTimer()
            return
        }

        timerButton?.setTitle("Stop Timer", for: .normal)
        setupTimer()
    }
    
    private func setupTimer() {
        ///normal
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { t in
            self.updateCount()
        })
        
        ///with fireDate
//        let current = Date()
//        let fireDate = current.addingTimeInterval(10)
//        timer = Timer.init(fire: fireDate, interval: 1, repeats: true) { t in
//            self.updateCount()
//        }
//        RunLoop.current.add(timer!, forMode: .common)
    }
    
    @objc func updateCount() {
        self.cnt += 1
        self.cntLabel?.text = "count: \(self.cnt)"
        print(self.cnt)
    }
    
    private func setupView() {
        timerButton?.setTitle("Start Timer", for: .normal)
        cntLabel?.text = "count: \(cnt)"
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        cnt = 0
        setupView()
    }
}

