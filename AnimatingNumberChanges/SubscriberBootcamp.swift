//
//  SubscriberBootcamp.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 11/12/2023.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    var anyCancellable = Set<AnyCancellable>()
    
   @Published var textFieldText = ""
    @Published var textIsValid = false

    @Published var showButton = false
    var timer: AnyCancellable?
    
    init() {
        setupTimer()
        addButtonSubscriber()
        addTextFieldSubscriber()
    }
    
    func addTextFieldSubscriber(){
       $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map{ $0.count > 3 }
//            .assign(to: \.textIsValid, on: self)
            .sink {[weak self] bool in
                guard let self else { return }
                textIsValid = bool
            }
            .store(in: &anyCancellable)
            
            
    }
    
    func setupTimer(){
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                count += 1
                if count == 10 {
                    for _ in anyCancellable {
                        //cancellable.cancel()
                    }
                }
            }
           .store(in: &anyCancellable)
            
        
    }
    
    func addButtonSubscriber(){
        $textIsValid
            .combineLatest($count)
            .sink {[weak self] (bool,count) in
                if bool && count < 20 {
                    self?.showButton = true
                } else {
                    self?.showButton = false
                }
            }
            .store(in: &anyCancellable)
    }
    
}



struct BootCampView: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
            Text("\(vm.textIsValid.description)")
            TextField("Type something here", text: $vm.textFieldText)
               
                .frame(width: .infinity, height: 50, alignment: .center)
                .padding(.leading)
                .foregroundStyle(.black)
                .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .trailing) {
                    ZStack {
                        Image(systemName: "xmark")
                        .foregroundStyle(.red)
                        .opacity(vm.textFieldText.isEmpty ? 0.0 :
                            vm.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1.0: 0.0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                }
                .padding(.horizontal)

            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity, height: 50, alignment: .center)
                        .padding(.horizontal)
                        Text("Submit")
                        .foregroundStyle(.white)
                }
                    
            }
            )
            .opacity(vm.showButton ? 1.0 : 0.3)
            .disabled(!vm.showButton)
        }
    }
}

#Preview {
    BootCampView()
}


extension String: View {
    public var body: some View {
        Text(self)
    }
    
    
}
