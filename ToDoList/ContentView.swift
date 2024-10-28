import SwiftUI

struct ContentView: View {

    @State private var newTodoItem = ""
    @StateObject private var viewModel = TodoListViewModel()
    var body: some View {
        VStack {
            Text("Todo List 📝")
                .font(.largeTitle)
                .padding()
            List {
                ForEach(viewModel.todoItems) { item in
                    HStack {
                        Text(item.title)
                            .strikethrough(item.isComplete)
                            .foregroundColor(item.isComplete ? .gray : .primary)
                        Spacer()
                        Button(action: {
                            viewModel.toggleTodoItemCompletion(item)
                        }) {
                            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                                .foregroundColor(item.isComplete ? Color.green : Color.red)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteTodoItem)
            }
            .cornerRadius(10)
            HStack {
                TextField("Enter new Todo item", text: $newTodoItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    viewModel.addTodoItem(title: newTodoItem)
                    newTodoItem = ""
                }) {
                    Text("Add")
                }
                .padding()
            }
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
