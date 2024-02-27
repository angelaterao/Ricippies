//
//  ContentView.swift
//  Ricippies
//
//  Created by Angela Terao on 13/12/2023.
//

import SwiftUI

struct RicippiesTabView: View {
    
    let tabBarImageNames = [Constants.home,
                            Constants.list,
                            Constants.add,
                            Constants.bookmark,
                            Constants.account]
    
    @State var selectedIndex = 0
    @State var showModal = false
    
    
    
//    init() {
//        UITabBar.appearance().unselectedItemTintColor = UIColor.systemBackground
//    }
    
    var body: some View {
        VStack {
            
            ZStack {
                switch selectedIndex {
                case 0:
                    FeedView()
                case 1:
                    CategoriesView()
                case 3:
                    SavedRicippiesView()
                case 4:
                    AccountView()
                default:
                    Text("Remaining Tabs")
                }
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                ForEach(0..<5) { num in
                    
                    Button {
                        if num == 2 {
                            showModal.toggle()
                        } else {
                            selectedIndex = num
                        }
                    } label: {
                        
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color(Constants.brandPrimary))
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        
                        Spacer()
                    }
                }
                Spacer()
            }
            
        }
        .fullScreenCover(isPresented: $showModal) {
            AddRecipeView()
        }
        

        
        
//        TabView(selection: $selection) {
//            FeedView()
//                .tabItem {
//                    Image(Constants.home)
//                        .renderingMode(.template)
//                        .foregroundColor(Color(Constants.brandPrimary))
//
//                    Text("Home")
//                }
//                .tag(0)
//
//            CategoriesView()
//                .tabItem {
//                    Image(Constants.list)
//                        .renderingMode(.template)
//                        .foregroundColor(Color(Constants.brandPrimary))
//                    Text("Categories")
//                }
//                .tag(1)
//
//            AddRicippieView()
//                .tabItem {
//                    Image(Constants.add)
//                        .renderingMode(.template)
//                        .foregroundColor(Color(Constants.brandPrimary))
//
//                    Text("Add")
//                }
//                .tag(2)
//
//
//            SavedRicippiesView()
//                .tabItem {
//                    Image(Constants.bookmark)
//                        .renderingMode(.template)
//                        .foregroundColor(Color(Constants.brandPrimary))
//                    Text("Saved")
//                }
//                .tag(3)
//
//            AccountView()
//                .tabItem {
//                    Image(Constants.account)
//                        .renderingMode(.template)
//                        .foregroundColor(Color(Constants.brandPrimary))
//                    Text("Account")
//                }
//                .tag(4)
//        }
//        .accentColor(Color(Constants.brandPrimary))
    }
}

struct RicippiesTabView_Previews: PreviewProvider {
    static var previews: some View {
        RicippiesTabView()
    }
}

