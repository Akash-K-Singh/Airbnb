import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass")}
            
            WishListView()
                .tabItem { Label("WishLists", systemImage: "heart")}
            
            ProfileView()
                .tabItem { Label("Profil", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView()
}
