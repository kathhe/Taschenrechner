//
//  ContentView.swift
//  Tschenrechner
//
//  Created by Kathrine Heinzel (875340)
//

import SwiftUI

struct ContentView: View {
    
    @State var value = "0"
    @State var ersteZifferEingegeben = false
    @State var zweiteZifferEingegeben = false
    @State var ersteZahlEingegeben = false
    @State var wert1 = 0
    @State var wert2 = 0
    @State var ergebnis = 0
    
    var opButtonBgColor: Color {
        return zweiteZifferEingegeben ? Color(red: 182 / 255, green: 224 / 255, blue: 254 / 255) : Color(red: 182 / 255, green: 224 / 255, blue: 254 / 255, opacity: 0.5)
    }
    var opButtonTxtColor: Color {
        return zweiteZifferEingegeben ? Color(red: 43 / 255, green: 103 / 255, blue: 255 / 255) : Color(red: 43 / 255, green: 103 / 255, blue: 255 / 255, opacity: 0.5)
    }
    var accentBgColor: Color {
        return ersteZifferEingegeben ? Color(red: 43 / 255, green: 103 / 255, blue: 255 / 255) : Color(red: 43 / 255, green: 103 / 255, blue: 255 / 255, opacity: 0.5)
    }
    var accentTxtColor: Color {
        return ersteZifferEingegeben ? Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255) : Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 0.5)
    }
    var zifferBg: Color {
        return Color(red: 238 / 255, green: 247 / 255, blue: 254 / 255)
    }
    var zifferText: Color {
        return Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
    }
    var acBgColor: Color {
        return .white
    }
    var acTxtColor: Color {
        return Color(red: 43 / 255, green: 103 / 255, blue: 255 / 255)
    }
    
    var zifferEcke: CGFloat = 0
    var buttonBreite: CGFloat = (UIScreen.main.bounds.width - ( 2 * 12)) / 4
    
    func tapNum(digit: String) {
        print("Number typed!")
        let number = digit
  
        if( ersteZahlEingegeben ) {
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
            
            wert2 = Int(value) ?? 0
            zweiteZifferEingegeben = true
            
        } else {
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
            
            wert1 = Int(value) ?? 0
            ersteZifferEingegeben = true
        }
    }
    
    func enter() {
        print("Enter tapped")
        ersteZahlEingegeben = true
        value = "";
    }
    func ac() {
        print("AC tapped")
        value = "0";
        ersteZahlEingegeben = false
        zweiteZifferEingegeben = false
        ersteZifferEingegeben = false
    }
    func add() {
        print("Plus tapped")
        value = String(wert1 + wert2)
        wert1 = wert1 + wert2
        zweiteZifferEingegeben = false
    }
    func subtract() {
        print("Minus tapped")
        value = String(wert1 - wert2)
        wert1 = wert1 - wert2
        zweiteZifferEingegeben = false
    }
    func multiply() {
        print("Multiply tapped")
        value = String(wert1 * wert2)
        wert1 = wert1 * wert2
        zweiteZifferEingegeben = false
    }
    func divide() {
        print("Divide tapped")
        value = String(wert1 / wert2)
        wert1 = wert1 / wert2
        zweiteZifferEingegeben = false
    }

    var body: some View {
        VStack(spacing:0) {
            zifferBg.edgesIgnoringSafeArea(.all)
            
            VStack(spacing:0) {
                // Display
                HStack(spacing:0) {
                    Spacer()
                    Text(value)
                        //.bold()
                        .font(.system(size: 52))
                        //.font(Font.custom("Futura", size: 52))
                        .foregroundColor(.black)
                        .padding(12)
                    
                    
                }
                .padding(0)
                .background(zifferBg)
            }
            
            VStack(spacing:2) {
                HStack(spacing: 2) {
                    Button(action: {
                        ac()
                    },
                           label: {
                            Text("AC")
                                .font(.system(size: 26))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(acBgColor)
                                .foregroundColor(acTxtColor)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    
//                    Spacer()
//                        .frame(width: 140, height: 50)
                    Button(action: {
                        enter()
                    },
                           label: {
                            Text("↵")
                                .font(.system(size: 24))
                                .frame(
                                    width: (buttonBreite * 3) + 4,
                                    height: buttonBreite
                                )
                                .background(accentBgColor)
                                .foregroundColor(accentTxtColor)
                                .cornerRadius(zifferEcke)
                        }
                    ).disabled(ersteZifferEingegeben == false)
                }
                
                HStack(spacing: 2) {
                    Button(action: {
                        tapNum(digit: "7")
                    },
                           label: {
                            Text("7")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        tapNum(digit: "8")
                    },
                           label: {
                            Text("8")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        tapNum(digit: "9")
                    },
                           label: {
                            Text("9")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        divide()
                    },
                           label: {
                            Text("÷")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(opButtonBgColor)
                                .foregroundColor(opButtonTxtColor)
                                .cornerRadius(zifferEcke)
                        }
                    ).disabled(zweiteZifferEingegeben == false)
                }
                
                HStack(spacing: 2) {
                    Button(action: {
                        tapNum(digit: "4")
                    },
                           label: {
                            Text("4")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    
                    Button(action: {
                        tapNum(digit: "5")
                    },
                           label: {
                            Text("5")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    
                    Button(action: {
                        tapNum(digit: "6")
                    },
                           label: {
                            Text("6")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    
                    Button(action: {
                        multiply()
                    },
                           label: {
                            Text("×")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(opButtonBgColor)
                                .foregroundColor(opButtonTxtColor)
                                .cornerRadius(zifferEcke)
                        }
                    ).disabled(zweiteZifferEingegeben == false)
                }
                
                // Row 3
                HStack(spacing: 2) {
                    Button(action: {
                        tapNum(digit: "1")
                    },
                           label: {
                            Text("1")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        tapNum(digit: "2")
                    },
                           label: {
                            Text("2")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        tapNum(digit: "3")
                    },
                           label: {
                            Text("3")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        subtract()
                    },
                           label: {
                            Text("–")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(opButtonBgColor)
                                .foregroundColor(opButtonTxtColor)
                                .cornerRadius(zifferEcke)
                        }
                    ).disabled(zweiteZifferEingegeben == false)
                }
                
                // Row 4
                HStack(spacing: 2) {
                    Button(action: {
                        tapNum(digit: "0")
                    },
                           label: {
                            Text("0")
                                .font(.system(size: 32))
                                .frame(
                                    width: (buttonBreite * 3) + 4,
                                    height: buttonBreite
                                )
                                .background(zifferBg)
                                .foregroundColor(zifferText)
                                .cornerRadius(zifferEcke)
                        }
                    )
                    Button(action: {
                        add()
                    },
                           label: {
                            Text("+")
                                .font(.system(size: 32))
                                .frame(
                                    width: buttonBreite,
                                    height: buttonBreite
                                )
                                .background(opButtonBgColor)
                                .foregroundColor(opButtonTxtColor)
                                .cornerRadius(zifferEcke)
                        }
                            
                    ).disabled(zweiteZifferEingegeben == false)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
