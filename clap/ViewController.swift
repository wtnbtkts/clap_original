//
//  ViewController.swift
//  clap
//
//  Created by Takatoshi Watanabe on 2015/06/14.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate,AVAudioPlayerDelegate {
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer : AVAudioPlayer!
    var soundCount:Int=0
    
    
    var stations = ["わずか、1問正解！", "まあ、2問正解！", "おお、3問正解！", "さすが、4問正解！"]
    //var filenames: [String!] = ["dog", "cat", "rain" ,"wave"]
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        //再生する音源のURLを生成.
        let soundFilePath = NSBundle.mainBundle().pathForResource("answer", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath:soundFilePath)!
        
        
        //AVAudioPlayerのインスタンス化.!
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)

    }
    
    /*
    func playerWithFilename(filename: String!) -> AVAudioPlayer {
    let soundFilePath = NSBundle.mainBundle().pathForResource(filename, ofType: "mp3")!
    let fileURL : NSURL = NSURL(fileURLWithPath:soundFilePath)!
    
    
    //AVAudioPlayerのインスタンス化.!
    return AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    }
    */
    
    
    /*
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
    return 1
    }
    //いくつ選択肢をつくるか
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    return 10
    
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String! {
    return "\(row+1)回"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
    soundCount = row
    }*/
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stations.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return stations[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton(){
        //audioPlayer = playerWithFilename(filenames)
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
    
    
}
