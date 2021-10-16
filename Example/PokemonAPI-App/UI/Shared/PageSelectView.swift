//
//  PageSelectView.swift
//  PageSelectView
//
//  Created by Christopher Jennewein on 10/16/21.
//

import SwiftUI


struct PageSelectView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var pages: Int
    @Binding var pageIndex: Int
    
    var body: some View {
        List {
            ForEach(0..<pages, id: \.self) { page in
                Button("Page \(page + 1)") {
                    pageIndex = page
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}


struct PageSelectView_Previews: PreviewProvider {
    static var previews: some View {
        PageSelectView(pages: 5, pageIndex: .constant(0))
    }
}
