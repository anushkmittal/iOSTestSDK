//
//  cr.swift
//  Your Cancelled
//
//  Created by Anushk Mittal on 3/4/20.
//  Copyright © 2020 Memeois, Inc. All rights reserved.
//

import Foundation
// Unhashed nonce.
var currentNonce: String?

#if canImport(CryptoKit)
    import CryptoKit
#endif

@available(iOS 13.0, *)
func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
    }.joined()

    return hashString
}
