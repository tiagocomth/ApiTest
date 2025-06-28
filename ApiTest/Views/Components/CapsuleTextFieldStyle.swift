//
//  CapsuleTextFieldStyle.swift
//  CookBook
//
//  Created by Thiago de Jesus on 08/06/25.
//

import Foundation
import SwiftUI

struct CapsuleTextFieldStyle: TextFieldStyle {
    
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack{
            configuration
                .padding()
                .background(
                    Capsule().fill(Color.gray.opacity(0.4))
                        
                )

        }
    }
}
