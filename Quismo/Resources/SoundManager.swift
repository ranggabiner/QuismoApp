//
//  SoundManager.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 21/08/24.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var audioPlayer: AVAudioPlayer?
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "puppy-barking-felix-blume-1-00-01", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Couldn't load sound file")
        }
    }
}
