//
//  ContentView.swift
//  TH03_Edward G
//
//  Created by student on 30/09/25.
//
import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            StatsView()
                .tabItem { Label("Statistics", systemImage: "chart.bar.xaxis") }
            
            SettingView()
                .tabItem { Label("Setting", systemImage: "gear") }
        }
        .tint(.red)
    }
}

struct HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Good Morning,")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        Text("Mikaela")
                            .font(.title.bold())
                    }
                    .padding() //buat supaya ada jarak dari text ke search bar
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .foregroundColor(.pink)
                }
                .padding(.horizontal)
                
                // Search bar
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(color: .black, radius: 10, x:2, y:2)
                    .padding(.horizontal)
                    
                
                // Today’s Goal
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(
                            colors: [.cyan, .purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .shadow(radius: 5)
                    
                    VStack(spacing: 16) {
                        Text("Today's Goal")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        HStack(spacing: 12) {
                            statsAtas(title: "4 Miles", subtitle: "@Thames Route", icon: "figure.walk")
                            statsAtas(title: "2 Miles", subtitle: "@River Lea", icon: "sailboat.fill")
                        }
                    }
                    .padding()
                }
                .frame(height: 200)
                .padding(.horizontal)
                
                // Stats Grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    statsBawah(icon: "heart.fill", value: "68 Bpm", color: .purple)
                    statsBawah(icon: "flame.fill", value: "0 Kcal", color: .orange)
                    statsBawah(icon: "scalemass.fill", value: "73 Kg", color: .green)
                    statsBawah(icon: "bed.double.fill", value: "6.2 Hr", color: .blue)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}

struct statsAtas: View {
    var title: String
    var subtitle: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            Text(title)
                .font(.title3.bold())
                .foregroundColor(.white)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(Color.white.opacity(0.2))
        .cornerRadius(12)
    }
}
struct statsBawah: View {
    var icon: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            HStack{
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text(value)
                    .font(.headline)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}
//TAB DIBAWAH
struct SearchView: View {
    var body: some View {
        Text("Search Page 👀🔍").font(.title2)
    }
}
struct StatsView: View {
    var body: some View {
        Text("Profile Page 👤").font(.title2)
    }
}
struct SettingView: View {
    var body: some View {
        Text("Setting Page ⚙️").font(.title2)
    }
}

#Preview { ContentView() }


