//
//  OnDemandBookListViewWithClosures.swift
//  CombineFirebaseBookShelf
//
//  Created by NoelMacMini on 4/9/25.
//

import SwiftUI
import Combine
import FirebaseFirestore

private class BookListViewModel: ObservableObject {
  @Published var books: [Book] = []
  @Published var errorMessage: String?
  
  private var db = Firestore.firestore()
  
  init() {
    db.collection("books").snapshotPublisher()
      // Firestore의 collectionReference를 사용하여 Firestore의 collecton을 가져온다.
      .map { querySnapshot in
        querySnapshot.documents.compactMap { documentSnapshot in
          try? documentSnapshot.data(as: Book.self)
        }
      }
      .catch { error in
        self.errorMessage = error.localizedDescription
        return Just([Book]()).eraseToAnyPublisher()
      }
      .replaceError(with: [Book]())
      .assign(to: &$books)
  }
}

struct CombineBookListView: View {
  @StateObject private var viewModel = BookListViewModel()
  
    var body: some View {
      List(viewModel.books) { book in
        Text(book.title)
      }
      .navigationTitle("Book List")
    }
}

#Preview {
  CombineBookListView()
}
