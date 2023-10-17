//
//  ContentView.swift
//  Notes
//
//  Created by Mario Steeven Garzon Serna on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var newNota = ""
    @State private var allnotes: [NotaItem] = []

    
    struct NotaItem: Identifiable {
        let id = UUID()
        let note: String
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Write here", text: $newNota)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    addNote()
                }) {
                    Image(systemName: "plus")
                }
                .padding()

                List {
                    ForEach(allnotes) { nota in
                        HStack {
                            Text(nota.note)
                            Spacer()
                            Button(action: {
                                deleteNote(nota)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }

                Text("Welcome back to Notes!")
            }
            .padding()
            .navigationTitle("Notes")
        }
    }

// Añadir una nota a allnotes como NotaItem
    
    func addNote() {
        guard !self.newNota.isEmpty else { return }
        self.allnotes.append(NotaItem(note: self.newNota))
        self.newNota = ""
    }

// Borrar una nota de allnotes como NotaItem por medio de su UUID
    
    func deleteNote(_ nota: NotaItem) {
        if let index = allnotes.firstIndex(where: { $0.id == nota.id }) {
            allnotes.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




