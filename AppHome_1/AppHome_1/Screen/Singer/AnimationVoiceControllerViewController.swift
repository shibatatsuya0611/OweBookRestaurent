//
//  AnimationVoiceControllerViewController.swift
//  AppHome_1
//
//  Created by Xuan Huy on 5/5/20.
//  Copyright © 2020 Xuan Huy. All rights reserved.
//

import UIKit
import Speech


protocol animationVoiceDelegate: class
{
    func voicetext(text: String)
}
class AnimationVoiceControllerViewController: UIViewController, SFSpeechRecognizerDelegate
{
    
    weak var delegate: animationVoiceDelegate?
    
    let imgview3: UIImageView =
    {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "iconMicro")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = img.frame.size.width / 2
        
        return img
    }()
    
    let lblTextVoice: UILabel =
    {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nói tên khách hàng muốn tìm"
//        lbl.placeholder = "Nói tên khách hàng muốn tìm"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = UIColor(hex: "333333")
        lbl.font = UIFont(name: "Roboto-Regular", size: fontSize18)
        
        return lbl
    }()
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "vi"))
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    private var recognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    
    var pulseLayers = [CAShapeLayer]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Tìm kiếm Khách Hàng"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Trở lại", style: .plain, target: nil, action: nil)
        view.backgroundColor = .white
        
        
        view.addSubview(lblTextVoice)
        
        lblTextVoice.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 10, bottom: 0, right: 10), size: .zero)
        
        view.addSubview(imgview3)
        
        imgview3.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 50, height: 50))
        imgview3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imgview3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        creatPulse()
        
        //Voice
        speechRecognizer!.delegate = self
        getAudio()
        
    }
    
    func creatPulse()
    {
        for _ in 0...2
        {
            let cricularPath = UIBezierPath(arcCenter: .zero, radius: view.bounds.size.width / 2.3, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = cricularPath.cgPath
            pulseLayer.lineWidth = 2.0
            pulseLayer.fillColor = UIColor.green.cgColor
            
            pulseLayer.lineCap = CAShapeLayerLineCap.round
            pulseLayer.position = CGPoint(x: 25, y: 30)
            imgview3.layer.addSublayer(pulseLayer)
            pulseLayers.append(pulseLayer)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.animatePulse(index: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.animatePulse(index: 1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.animatePulse(index: 2)
            }
        }
    }
    
    func animatePulse(index: Int)
    {
        pulseLayers[index].strokeColor = UIColor.clear.cgColor
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 2.0
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 0.9
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "scale")
        
        let opacityAnimation  = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 2.0
        opacityAnimation.fromValue = 0.9
        opacityAnimation.toValue = 0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        
        pulseLayers[index].add(opacityAnimation, forKey: "opacity")
    }
    
    //MARK: SPEECH
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
        
        var timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.didFinishTalk), userInfo: nil, repeats: false)
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!, resultHandler: {(result, error) in

            var isFinal = false

            if result != nil {
                
//                self.creatPulse()
                
                timer.invalidate()
                timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.didFinishTalk), userInfo: nil, repeats: false)

                self.lblTextVoice.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }

            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)

                self.recognitionRequest = nil
                self.recognitionTask = nil
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
    
    @objc func didFinishTalk()
    {
        print("didfinishTask")
        recognitionRequest?.endAudio()
        self.audioEngine.stop()
        self.delegate?.voicetext(text: self.lblTextVoice.text ?? "")
        
        self.navigationController?.popViewController(animated: true)
    }
}
