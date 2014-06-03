//
//  Speaker.swift
//  TextNovelSpeaker
//
//  Created by 飯村 卓司 on 2014/06/04.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

import Foundation
import AVFoundation

class Speaker : NSObject, AVSpeechSynthesizerDelegate {
    enum Status {
        case Speaking, Stop
    }

    var	m_Synthesizer: AVSpeechSynthesizer
    var m_Voice: AVSpeechSynthesisVoice
    var m_Rate: Float
   
    var m_CurrentStatus: Status
    
    init() {
        m_Synthesizer = AVSpeechSynthesizer()
        m_Voice = AVSpeechSynthesisVoice(language: "ja_JP")
        m_Rate = 1.0
        m_CurrentStatus = Status.Stop

        super.init()
    }

    func Speak(text: String) -> Bool {
        switch m_CurrentStatus {
            case Status.Speaking:
                println("in speaking. skip speak: \(text)")
                return false
            default:
                break
        }
        var utterance = AVSpeechUtterance(string: text)
        utterance.voice = m_Voice
        utterance.rate = m_Rate
        m_Synthesizer.speakUtterance(utterance)

        return true
    }
    

    func didStartSpeechUtterance(utterance: AVSpeechUtterance){
        m_CurrentStatus = Status.Speaking
    }
    func didFinishSpeechUtterance(utterance:AVSpeechUtterance){
        m_CurrentStatus = Status.Stop
    }
    func didPauseSpeechUtterance(utterance: AVSpeechUtterance){
        m_CurrentStatus = Status.Stop
    }
    func didContinueSpeechUtterance(utterance: AVSpeechUtterance){
        m_CurrentStatus = Status.Speaking
    }
    func didCancelSpeechUtterance(utterance: AVSpeechUtterance){
        m_CurrentStatus = Status.Stop
    }

    func willSpeakRangeOfSpeechString(characterRange: NSRange, utterance: AVSpeechUtterance){
        println("speaking...")
    }
}