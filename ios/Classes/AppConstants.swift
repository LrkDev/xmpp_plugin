//
//  AppConstants.swift
//  Runner
//
//  Created by iMac on 25/11/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import XMPPFramework

//let APP_DELEGATE = UIApplication.shared.delegate as! FlutterXmppPlugin
var APP_DELEGATE = FlutterXmppPlugin() as! FlutterXmppPlugin

public var xmpp_HostName: String = ""
public var xmpp_HostPort: Int16 = 0
public var xmpp_UserId: String = ""
public var xmpp_UserPass: String = ""
 
let default_isPersistent : Bool = false

//MARK:- Struct's
struct pluginMethod {
    static let login : String                       = "login"
    static let sendMessage : String                 = "send_message"
    static let sendMessageInGroup : String          = "send_group_message"
    static let sendCustomMessage : String           = "send_custom_message"
    static let sendCustomMessageInGroup : String    = "send_customgroup_message"
    static let createMUC : String                   = "create_muc"
    static let joinMUC : String                     = "join_muc_groups"
    static let sendReceiptDelivery : String         = "send_delivery_receipt"
    static let addMembersInGroup : String           = "add_members_in_group"
    static let addAdminsInGroup : String            = "add_admins_in_group"
    static let getMembers : String                  = "get_members"
    static let getAdmins : String                   = "get_admins"
    static let getOwners : String                    = "get_owners"
}
struct pluginMessType {
    static let Incoming : String = "incoming"
    static let Message : String = "Message"
    static let ACK : String = "Ack";
    static let ACK_DELIVERY : String = "Delivery-Ack";
    static let ACK_READ : String = "Read-Ack";
}

struct xmppChatType {
    static let GROUPCHAT : String = "groupchat"
    static let CHAT : String = "chat"
    static let NORMAL : String = "normal"
}
struct xmppConstants {
    static let ERROR : String = "ERROR"
    static let SUCCESS : String = "SUCCESS"
    
    static let Resource : String = "iOS"
    static let BODY : String = "body"
    static let ID : String = "id"
    static let TO : String = "to"
    static let FROM : String = "from"
    
    static let DataNil : String = "Data nil"
}
struct xmppConnStatus {
    static let Processing : String = "Processing"
    static let Authenticated : String = "Authenticated"
    static let Failed : String = "Failed"
    static let Disconnect : String = "Disconnect"
}
struct xmppMUCRole {
    /*
     https://github.com/robbiehanson/XMPPFramework/issues/521#issuecomment-155471382
     moderator
     participant
     visitor
     moderator
     participant
     visitor
     */
    static let Owner : String = "owner"
    static let Admin : String = "admin"
    static let Member : String = "member"
}

class groupInfo {
    var name : String = ""
    var isPersistent : Bool = default_isPersistent
    var objRoomXMPP : XMPPRoom?
    
    func `init`() {
    }
    func initWith(name: String, isPersistent: Bool) {
        self.name = name
        self.isPersistent = isPersistent
    }
    func initWith(name: String, isPersistent: Bool, objRoomXMPP : XMPPRoom?) {
        self.initWith(name: name, isPersistent: isPersistent)
        self.objRoomXMPP = objRoomXMPP
    }
}

struct eleCustom {
    static let Name : String = "CUSTOM"
    static let Namespace : String = "urn:xmpp:custom"
    static let Kay : String = "custom"
}

//MARK:- Enum's
enum XMPPControllerError: Error {
    case wrongUserJID
}
enum xmppConnectionStatus : Int {
    case None
    case Processing
    case Sucess
    case Disconnect
    case Failed
    
    var value: Int {
        return rawValue
    }
}
enum xmppMUCUserType {
    case Owner
    case Admin
    case Member
    
}
enum Status {
    case Online
    case Offline
}

//MARK:- Extension
extension Notification.Name {
    static let xmpp_ConnectionReq = Notification.Name(rawValue: "xmpp_ConnectionReq")
    static let xmpp_ConnectionStatus = Notification.Name(rawValue: "xmpp_ConnectionStatus")
}

//MARK:- Notifcation Observers
public func postNotification(Name:Notification.Name, withObject: Any? = nil, userInfo:[AnyHashable : Any]? = nil){
    NotificationCenter.default.post(name: Name, object: withObject, userInfo: userInfo)
}
extension String {
    var boolValue: Bool {
        return (self as NSString).boolValue
    }
    
    func trim() -> String {
        self.trimmingCharacters(in: .whitespaces)
    }
}

func printLog(_ message : String) {
//    print(message)
}
