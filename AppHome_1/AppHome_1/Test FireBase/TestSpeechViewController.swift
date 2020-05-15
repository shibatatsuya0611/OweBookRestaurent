//
//  TestSpeechViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 4/29/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit
import Speech

class TestSpeechViewController: UIViewController, SFSpeechRecognizerDelegate
{

    let textView: UITextView =
    {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = colorTextField
        
        return txt
    }()
    
    let microphoneButton: UIButton =
    {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("OpenMicro", for: .normal)
        btn.backgroundColor = colorBtnEdit
        
        return btn
    }()
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "vi"))
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    private var recognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        self.title = "LearnSpeech"

        setupView()
        hideKeyBoardWhenTapAround()

        microphoneButton.isEnabled = false
               
        speechRecognizer?.delegate = self
               
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
                   
            var isButtonEnabled = false
                       
            switch authStatus {
            case .authorized:
                isButtonEnabled = true
                           
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")
                           
            case .restricted:
                   isButtonEnabled = false
                print("Speech recognition restricted on this device")
                           
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            @unknown default:
            break
            }
            
            OperationQueue.main.addOperation()
            {
                self.microphoneButton.isEnabled = isButtonEnabled
            }
        }
    }
    
    func setupView()
    {
        view.addSubview(textView)
        view.addSubview(microphoneButton)
        
        textView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 150, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))
        
        microphoneButton.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size: .init(width: 100, height: 40))
        microphoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        microphoneButton.addTarget(self, action: #selector(microTap(_sender:)), for: .touchUpInside)
    }
    
    @objc func microTap(_sender: Any)
    {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            microphoneButton.isEnabled = false
            microphoneButton.setTitle("Start Recording", for: .normal)
        } else {
            startRecording()
            microphoneButton.setTitle("Stop Recording", for: .normal)
        }
    }
    
    func startRecording() {
        
        if recognitionTask != nil {  //1
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()  //2
        do {
            try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()  //3
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        } //5
        
        recognitionRequest.shouldReportPartialResults = true  //6
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in  //7
            
            var isFinal = false  //8
            
            if result != nil {
                
                self.textView.text = result?.bestTranscription.formattedString  //9
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {  //10
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.microphoneButton.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)  //11
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()  //12
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        textView.text = "Say something, I'm listening!"
        
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            microphoneButton.isEnabled = true
        } else {
            microphoneButton.isEnabled = false
        }
    }

}
