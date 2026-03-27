//
//  Audio.swift
//  BirdAid
//
//  Created by Keshav Khari on 16/02/26.
//

import AVFoundation
import Combine

class AudioManager: ObservableObject {
    
    private var player: AVAudioPlayer?
    private var currentFileName: String?
    
    func play(fileName: String, fileExtension: String = "mp3") {
        
        if currentFileName == fileName,
           let player = player {
            
            if !player.isPlaying {
                player.play()
            }
            return
        }
        
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("File not found")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            currentFileName = fileName
            player?.play()
        } catch {
            print("Error playing audio")
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.stop()
        player = nil
        currentFileName = nil
    }
    
    
    func skipBackward(seconds: TimeInterval = 5) {
        guard let player = player else { return }
        player.currentTime = max(player.currentTime - seconds, 0)
    }
    
    
    func skipForward(seconds: TimeInterval = 5) {
        guard let player = player else { return }
        player.currentTime = min(player.currentTime + seconds, player.duration)
    }
}




