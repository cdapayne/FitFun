import Foundation
import WatchConnectivity

/// Manages communication with the paired Apple Watch and delivers metric updates.
class WatchMetricsManager: NSObject, WCSessionDelegate {
    static let shared = WatchMetricsManager()

    /// Closure invoked whenever the watch sends new metric values.
    var metricUpdateHandler: (([String: String]) -> Void)?

    override private init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    // MARK: - WCSessionDelegate

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let metrics = message["metrics"] as? [String: String] {
            metricUpdateHandler?(metrics)
        }
    }

    // iOS stubs to satisfy protocol requirements
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {}
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    #endif
}
