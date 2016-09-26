import Kitura

import PerformanceMonitoring

do {
    let performanceServer = try PerformanceMonitoringController()

    Kitura.addHTTPServer(onPort: 8090, with: performanceServer.router)
    Kitura.run()
} catch {

}
