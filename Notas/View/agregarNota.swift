//
//  agregarNota.swift
//  Notas
//
// José Roberto Mejía Pacheco on 05/12/22.
//

import SwiftUI

struct agregarNota: View {
    
    @ObservedObject var model : ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Divider()
            DatePicker("Fecha", selection: $model.fecha)
            Spacer()
            Text(model.updateItem != nil ? "Editar nota" : "Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)

            Button(action:{
                if model.updateItem != nil {
                    model.editData(context: context)
                }else{
                    model.saveData(context: context)
                }
            }){
                Label(
                    title: { Text("Guardar").foregroundColor(.white).bold() },
                    icon: { Image(systemName: "plus") }
)
            }.padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(model.nota == "" ? Color.green : Color.red)
            .cornerRadius(8)
            .disabled(model.nota == "" ? true : false)
            
        }.padding().background(Color.yellow)
    }
}

