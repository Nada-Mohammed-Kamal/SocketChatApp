//
//  SocketIOManager.swift
//  SocketChat
//
//  Created by Nada Elmasry on 15/09/2022.
//  Copyright © 2022 AppCoda. All rights reserved.
//

import UIKit
import SocketIO
//

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://192.168.XX.XX:3000")! as URL)
    
    override init() {
        super.init()
    }
    
    
    func establishConnection() {
        socket.connect()
    }
     
     
    func closeConnection() {
        socket.disconnect()
    }

    
    func connectToServerWithNickname(nickname: String, completionHandler: @escaping (_ userList: [[String: AnyObject]]?) -> Void) {
        socket.emit("connectUser", nickname)
        
        //When the user list is received from the server, we call our own method’s completion handler passing as an argument that list. It is obviously an array with dictionaries as objects, and that’s why the conversion above is necessary to happen.
        socket.on("userList") { ( dataArray, ack) -> Void in
            completionHandler((dataArray[0] as! [[String: AnyObject]]))
            }
        
        listenForOtherMessages()
    }
    
    
    func exitChatWithNickname(nickname: String, completionHandler: () -> Void) {
        socket.emit("exitUser", nickname)
        completionHandler()
    }
    
    
    func sendMessage(message: String, withNickname nickname: String) {
        socket.emit("chatMessage", nickname, message)
    }
    
    func getChatMessage(completionHandler: @escaping (_ messageInfo: [String: AnyObject]) -> Void) {
        socket.on("newChatMessage") { (dataArray, socketAck) -> Void in
            var messageDictionary = [String: AnyObject]()
            messageDictionary["nickname"] = dataArray[0] as! String as AnyObject
            messageDictionary["message"] = dataArray[1] as! String as AnyObject
            messageDictionary["date"] = dataArray[2] as! String as AnyObject
     
            completionHandler(messageDictionary)
        }
    }
    
    
    private func listenForOtherMessages() {
        socket.on("userConnectUpdate") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userWasConnectedNotification") , object: dataArray[0] as! [String: AnyObject])
        }
     
        socket.on("userExitUpdate") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post( name : NSNotification.Name(rawValue:"userWasDisconnectedNotification"), object: dataArray[0] as! String)
        }
        
        socket.on("userTypingUpdate") { (dataArray, socketAck) -> Void in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userTypingNotification") , object: dataArray[0] as? [String: AnyObject])
            }
    }
    
    func sendStartTypingMessage(nickname: String) {
        socket.emit("startType", nickname)
    }
    
    func sendStopTypingMessage(nickname: String) {
        socket.emit("stopType", nickname)
    }
}
