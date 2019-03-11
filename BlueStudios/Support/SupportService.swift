//
//  SupportService.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 11/03/2019.
//  Copyright © 2019 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import Intercom

class SupportService {
	static let instance = SupportService()
	
	func start (useName: String? = nil) {
		Intercom.setApiKey(ThirdParty.Intercom.key, forAppId:ThirdParty.Intercom.appId)
		login(userName: useName)
	}
	
	func close () {
		logout()
	}
	
	func saveToken (token: Data) {
		Intercom.setDeviceToken(token)
	}
	
	func isSupportPushNotification (userInfo: [AnyHashable : Any]) -> Bool {
		return Intercom.isIntercomPushNotification(userInfo)
	}
	
	func handleSupportPushNotification (userInfo: [AnyHashable : Any] ) {
		Intercom.handlePushNotification(userInfo)
	}
	
	func setLauncherVisible(visible: Bool) {
		Intercom.setLauncherVisible(visible)
	}
	
	func hiddeMessenger () {
		Intercom.hideMessenger()
	}
	
	private func login (userName: String? = nil) {
		if let name = userName {
			Intercom.registerUser(withEmail: name)
		} else {
			Intercom.registerUnidentifiedUser()
		}
	}
	
	private func logout () {
		Intercom.logout()
	}
}
