//
//  ViewController.swift
//  TextNovelSpeaker
//
//  Created by 飯村 卓司 on 2014/06/03.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var m_Speaker: Speaker
    
    init(){
        m_Speaker = Speaker()
        super.init(nibName: nil, bundle: nil)
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        m_Speaker.Speak("こんにちは hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

