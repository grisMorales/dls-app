//
//  HomeView.swift
//  dls-app
//
//  Created by Griselda Morales on 11/07/23.
//

import SwiftUI
import Combine
import dls_framework

struct HomeView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
        
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.orange
        UINavigationBar.appearance().backgroundColor = UIColor.green
        UITableView.appearance().backgroundColor =  UIColor.gray
    }
    
    func setAppTheme(){
        //MARK: use saved device theme from toggle
        isDarkModeOn = UserDefaultsUtils.shared.getDarkMode()
        //MARK: or use device theme
        print("setAppTheme",isDarkModeOn)
        
       /*  if (colorScheme == .dark)
         {
             isDarkModeOn = true
         }
         else{
             isDarkModeOn = false
         }*/
         
        changeDarkMode(state: isDarkModeOn)
    }
    
    func changeDarkMode(state: Bool){
        print(state)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
        UserDefaultsUtils.shared.setDarkMode(enable: state)
    }
    
    var ToggleThemeView: some View {
        Toggle("Dark Mode", isOn: $isDarkModeOn).onChange(of: isDarkModeOn) { (state)  in
            changeDarkMode(state: state)
        }.labelsHidden()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.BackgroundColorListA.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Switch theme").foregroundColor(Color.TextColorSecondaryA).padding(10)
                        
                        //.font(Font.custom("Baloo-Regular", size: 15))
                    ToggleThemeView
                }
                .background(Color.BackgroundColorListA)
                //.font(Font.custom("Baloo-Regular", size: 20))
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(
                    leading:
                        Text("DarkModeSwitch")
                        //.font(Font.custom("Baloo-Regular", size: 20))
                       
                )
                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color.TextColorPrimaryA)
            }
        }
        .background(Color.BackgroundColorListA)
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            setAppTheme()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environment(\.colorScheme, .light)  //Light mode
        
        HomeView()
            .environment(\.colorScheme, .dark)  //Dark mode
        
        HomeView()
            .environment(\.colorScheme, .light)  //Light mode
            .previewLayout(PreviewLayout.fixed(width: 896, height: 414))//Landscape
        
        HomeView()
            .environment(\.colorScheme, .dark)  //Dark mode
            .previewLayout(PreviewLayout.fixed(width: 896, height: 414))//Landscape
            }
}
