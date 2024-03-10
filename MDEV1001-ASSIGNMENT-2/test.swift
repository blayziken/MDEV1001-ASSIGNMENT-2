//
//  test.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import SwiftUI

struct test: View {
    
//    let dataImporter = DataImporter()

//    var abc = ["1", "2", "3"]
//    var items2 = [ItemData(id: "1", name: "aaa"), ItemData(id: "2", name: "bbb")]

    
    var body: some View {
        VStack {
            Text("Hello, World!")
            ForEach(items2, id: \.self) { item in
                Text("omo")
            }
        }
//        .onAppear {
//                        preloadData()
//                    }
    }
    
//    func preloadData() {
//            dataImporter.preloadData()
//        }
}

#Preview {
    test()
}
