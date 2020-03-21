import Foundation


struct Calculator {
    
    init() {
        
    }
    
    func Calculate(x num1: Double , y num2: Double , operation op: String) -> Double {
        
        print(num1 , num2)
        
        switch op {
        case "/" :
            return round(((num1  / num2) * 10000)) / 10000 ;
        case "*" :
            return num1 * num2 ;
        case "+" :
            return num1 + num2 ;
        case "-" :
            return num1 - num2 ;
        default :
            return 0.0
        }
        
    }
    
    
    
    func NumberBuilder( inputString: String ,resultLabel: String) ->String {
        
        var resultLabel1 = resultLabel
        
        if let _ = resultLabel1.firstIndex(of: ".") , inputString == "." {
            return resultLabel1;
        }
        
        if   resultLabel1 == "0" {
            resultLabel1.removeFirst()
        } else if  resultLabel1[resultLabel.startIndex] == "." {
            resultLabel1 = "0" + resultLabel
        }
    
        resultLabel1 += inputString
        return resultLabel1
    }
    
}
