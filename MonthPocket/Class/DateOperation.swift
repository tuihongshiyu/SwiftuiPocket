import SwiftUI
class DateStringOP {
    
    func getTodayString() -> String{
        return dateToString(date: Date())
    }
    
    func dateToString(date:Date, dateFormat:String="yyyy-MM-dd") -> String {
    //        let timeZone = TimeZone.init(identifier: "UTC")
            let timeZone = TimeZone.init(identifier: "Asia/Shanghai")
            let formatter = DateFormatter()
            formatter.timeZone = timeZone
            formatter.locale = Locale.init(identifier: "zh_CN")
            formatter.dateFormat = dateFormat
            let date = formatter.string(from: date)
            return date.components(separatedBy: " ").first!
        }
    
    func StringToDate(date:String) -> Date{
        let timeZone = TimeZone.init(identifier: "Asia/Shanghai")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd"
        let df = formatter.date(from: date)
        return df!
    }
}
