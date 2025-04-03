//
//  ViewThatFits.swift
//  PowerfulSwiftUI
//
//  Created by NoelMacMini on 4/3/25.
//

import SwiftUI

struct ViewThatFitsExample: View {
    var body: some View {
        VStack {
            Text("ViewTahtFits Example")
                .font(.title)
                .padding()
            ViewThatFits(in: .horizontal) {
                // First option (hightest priority) - full view
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("This is the complete text that will be displayed if there's enough space")
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.2)))
                
                // Second option - more compact view
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("Shorter text")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.2)))
                
                // Third option - minimal view
                Text("Minimal")
                  .padding()
                  .background(RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.2)))
            }
            Spacer()

            Text("Try changing the screen size to see the view adapt")
              .font(.caption)
              .padding()
        }
        
    }
}

#Preview {
    ViewThatFitsExample()
}
