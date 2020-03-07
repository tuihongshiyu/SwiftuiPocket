import SwiftUI

struct Pocket: Hashable,Identifiable {
    
    var id = UUID()
    var dateString = DateStringOP().dateToString(date: Date())
    var accountList = [Accout]()
    var moneyTotal:Int = 0
    var moneyPlusTotal:Int = 0
    var moneyMinusTotal:Int = 0
}
extension Pocket{  //日期操作
    mutating func setDateToday(){
        let dateNow = Date()
        dateString = DateStringOP().dateToString(date: dateNow)
    }
    
    mutating func changeDate(date: Date){
        dateString = DateStringOP().dateToString(date: date)
    }
    
    mutating func getTimeinterval() -> TimeInterval{
        return DateStringOP().StringToDate(date: dateString).timeIntervalSince1970
    }
    
}
extension Pocket{
    mutating func setAccout(id: UUID, name: String, value: Int){
        if accountList.isEmpty{
            accountList.append(Accout(accountID: id, name: name, value: value))
        }
        else{
            for i in 0...accountList.count-1{
                if accountList[i].accountID == id {
                    accountList[i].name = name
                    accountList[i].value = value
                    updateAccoutView()
                    return
                }
            }
            accountList.append(Accout(accountID: id, name: name, value: value))
            updateAccoutView()
        }
    }
    
    mutating func calTotal(){
        var Total = 0
        var PlusTotal = 0
        var MinusTotal = 0
        for accout in self.accountList{
            Total += accout.value
            if accout.value > 0{
                PlusTotal += accout.value
            }
            else{
                MinusTotal += accout.value
            }
            
        }
        moneyTotal = Total
        moneyPlusTotal = PlusTotal
        moneyMinusTotal = MinusTotal
    }
    
    mutating func accountListSort(){
        accountList.sort{ $0.value > $1.value }
    }
    
    mutating func updateAccoutView(){
        calTotal()
        accountListSort()
    }
}
