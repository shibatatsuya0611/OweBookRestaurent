//
//  SpeechViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 4/28/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit
import Speech

class SpeechViewController: UIViewController, SFSpeechRecognizerDelegate
{
    let textView: UITextView =
    {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = colorTextField
        
        return txt
    }()
    
    let btnMicro: UIButton =
    {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("OpenMicro", for: .normal)
        btn.backgroundColor = colorBtnEdit
        
        return btn
    }()
    
    private var speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale.init(identifier: "vi"))
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    private var recognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        self.title = "LearnSpeech"

        setupView()
        
        
        speechRecognizer!.delegate = self
        speechRecognizer(self.speechRecognizer!, availabilityDidChange: true)
        
    }
    
    fileprivate func setupView()
    {
        view.addSubview(textView)
        view.addSubview(btnMicro)
        
        textView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 150, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))
        
        btnMicro.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size: .init(width: 100, height: 40))
        btnMicro.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnMicro.addTarget(self, action: #selector(microTap(_sender:)), for: .touchUpInside)
    }
    
    
    @objc func microTap(_sender: Any)
    {
        print("Press OpenMic")
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            switch authStatus
            {
                case .authorized:
                    break
                      // Người dùng đồng ý phân quyền
                case .denied:
                       print("User denied access to speech recognition")
                case .restricted:
                       print("Speech recognition restricted on this device")
                case .notDetermined:
                       print("Speech recognition not yet authorized")
                @unknown default:
                    break
            }
        }
        getAudio()
    }
    
    func getAudio()
    {
        
        let audioSession = AVAudioSession.sharedInstance()
        do
        {
            try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }
        catch
        {
            print("audioSession properties weren\'t set because of an error.")
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!, resultHandler: {(result, error) in

            var isFinal = false

            if result != nil {

                self.textView.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }

            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)

                self.recognitionRequest = nil
                self.recognitionTask = nil

                self.btnMicro.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn\'t start because of an error.")
        }
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool)
    {
        if available {
            btnMicro.isEnabled = true
        } else {
            btnMicro.isEnabled = false
        }
        audioEngine.stop()
        recognitionRequest?.endAudio()
    }
    
}
