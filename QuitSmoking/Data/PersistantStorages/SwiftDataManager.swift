//
//  SwiftDataManager.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation
import SwiftData

public class SwiftDataManager {
    public static var shared = SwiftDataManager()
    var container: ModelContainer?
    var context: ModelContext?

    init() {
        do {
            container = try ModelContainer(for: UserStorage.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            debugPrint("Error initializing database container:", error)
        }
    }
}
