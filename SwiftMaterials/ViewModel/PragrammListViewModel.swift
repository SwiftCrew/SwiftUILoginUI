//
//  PragrammListViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation

class PragrammListViewModel: ObservableObject {


    @Published var list: [ProgrammList] = []

    init() {
        list = [
            ProgrammList(name: "Player List", type: .list),
            ProgrammList(name: "To Do List", type: .todoList),
            ProgrammList(name: "Progress Bar", type: .progressBar),
            ProgrammList(name: "Animated View", type: .transitionAnimation),
            ProgrammList(name: "Promo Code", type: .promoCode),
            ProgrammList(name: "ScrollView Animation", type: .scrollViewWithAnimation),
            ProgrammList(name: "MusicPlayerView Layout", type: .musicPlayerViewLayout),
            ProgrammList(name: "MapKit With Action Sheet", type: .mapKitWithActionSheet),
            ProgrammList(name: "OnboardingView", type: .onboardingView)
        ]
    }
}
