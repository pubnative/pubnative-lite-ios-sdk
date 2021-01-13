//
//  Copyright © 2020 PubNative. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public typealias ReportingKey = String

@objc
public class HyBidReportingEvent: NSObject {
    
    @objc public var properties: [ReportingKey: String] = [:]
    @objc public var eventType: String?
    
    @objc
    public init(with eventType: String, adFormat: String? = nil, properties: [ReportingKey: String]? = [:]) {
        self.eventType = eventType
        self.properties = properties ?? [:]
        self.properties[Common.EVENT_TYPE] = eventType
        self.properties[Common.AD_FORMAT] = eventType
        self.properties[Common.TIMESTAMP] = "\(Date().millisecondsSince1970)"
    }
    
    @objc
    public func toJSON() -> String {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(properties),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            return ""
        }
        return jsonString
    }
}

extension Date {
    
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
}
