//
//  testImage.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import SwiftUI

struct testImage: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1497215728101-856f4ea42174?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3NzA0MTF8MHwxfHNlYXJjaHwxfHxvZmZpY2V8ZW58MHx8fHwxNzUxMTIyMTk2fDA&ixlib=rb-4.1.0&q=80&w=400")!)
    }
}

#Preview {
    testImage()
}
