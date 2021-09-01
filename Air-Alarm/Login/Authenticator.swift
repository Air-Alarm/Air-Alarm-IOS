//
//  Authenticator.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/15.
//

import SwiftUI

class Authenticator: ObservableObject {
  @Published var needsAuthentication: Bool
  @Published var isAuthenticating: Bool

  init() {
    self.needsAuthentication = true
    self.isAuthenticating = false
  }

  func login(username: String, password: String) { //로그인할 때 아이디 비밀번호 받기
    self.isAuthenticating = true
    // emulate a short delay when authenticating
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { //시간차 두기
      self.isAuthenticating = false // 로그인양식이 무엇인지
      self.needsAuthentication = false // 로그아웃 -> ture, 로그인 -> false
    }
  }

  func logout() { //로그아웃일때 needsAuthentication 값을로 다시 뒤집어 true로그인을 다시 확인해야됨.
    self.needsAuthentication = true
  }
}
