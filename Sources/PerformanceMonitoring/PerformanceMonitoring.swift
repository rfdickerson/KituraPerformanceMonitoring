import Kitura
import Aphid
import Foundation

final class PerformanceMonitor {
    
    let aphid = Aphid(clientId: "monitoring")
    
    static var sharedInstance: PerformanceMonitor!
    
    public init() throws {
        PerformanceMonitor.sharedInstance = self
        try aphid.connect()
    }
    
    public func send(message: String) {
        aphid.publish(topic: "monitoring/get", withMessage: message)
    }
    
}

/**
 measureBlock
 
 Used to measure the performance inside of a block of a function.
*/
func measureBlock(_ functionName: String = #function, lineNum: Int = #line,
                  f: (Void) throws ->Void) rethrows {
    let oldTime = Date()
    
    defer {
        let newTime = Date()
        let dt = newTime.timeIntervalSince(oldTime)
        
        PerformanceMonitor.sharedInstance.send(message: "\(functionName):\(lineNum) took \(dt) seconds")
    }
    
    return try f()
    
}


public class PerformanceMonitoringController {
    
    public let router = Router()
    let monitor = try? PerformanceMonitor()
    
    public init() throws {
        
        router.get("/", handler: handleGet)
    }
    
    
}

extension PerformanceMonitoringController {
    
    func handleGet(request: RouterRequest,
                   response: RouterResponse,
                   next: @escaping() -> Void) throws
    {
        measureBlock {
            // Do lots of work here
            sleep(1)
        }
        
        response.status(.OK).send("hello")
        
        next()
    }
}
