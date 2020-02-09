import Foundation
import SwiftDate

extension String {

    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self)
    }
}

extension Date {

    func toMessageDatetime() -> String {
        let timeInterval = Date().timeIntervalSince(self)
        let min = Int(timeInterval / 60)
        let hour = Int(min / 60)

        if min < 1 {
            return "今"
        } else if min < 60 {
            return "\(min)分前"
        } else if hour < 24 {
            return "\(hour)時間前"
        } else if self.isToday {
            return "今日"
        } else if self.isYesterday {
            return "昨日"
        }
        let format = DateFormatter()
        format.dateFormat = "M/d"
        return format.string(from: self)
    }
}
