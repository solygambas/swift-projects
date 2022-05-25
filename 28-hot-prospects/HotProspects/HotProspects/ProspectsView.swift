//
//
// ProspectsView.swift
// HotProspects
//
// Created by Solygambas on 24/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var isShowingSettings = false
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    enum SortType {
        case none, name, date
    }
    
    @State private var sort = SortType.none
    var sortedProspects: [Prospect] {
        switch sort {
        case .none:
            return filteredProspects
        case .name:
            return filteredProspects.sorted()
        case .date:
            return filteredProspects.sorted(by: { $0.date > $1.date})
                }
    }
    
    let filter: FilterType
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedProspects) { prospect in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark")
                                    .foregroundColor(prospect.isContacted ? .green : .red)
                                Text(prospect.name)
                                    .font(.headline)
                            }
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isShowingSettings = true
                        } label: {
                            Label("Sort", systemImage: "arrow.up.arrow.down")
                        }
                                        }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
    //                        let prospect = Prospect()
    //                        prospect.name = "James Gandolfini"
    //                        prospect.emailAddress = "james@gandolfini.com"
    //                        prospects.people.append(prospect)
                            isShowingScanner = true
                        } label: {
                            Label("Scan", systemImage: "qrcode.viewfinder")
                        }
                                        }
                    
                    
                }
                .confirmationDialog("Sort", isPresented: $isShowingSettings) {
                                Button("None") { sort = .none }
                                Button("Sort by name") { sort = .name }
                                Button("Sort by most recent") { sort = .date }
                                Button("Cancel", role: .cancel) { }
                            }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Lorraine Bracco\nlorraine@bracco.com", completion: handleScan)
                }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            prospects.add(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            var dateComponents = DateComponents()
            dateComponents.hour = 9 // 9 am
            //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            // for testing purposes (5 seconds)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
