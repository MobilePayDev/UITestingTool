import Foundation

public final class UITestingConfiguration {

    private let map: [(Configuration.Type, ConfigurationWorker.Type)]

    public init(map: [(Configuration.Type, ConfigurationWorker.Type)]) {
        self.map = map
    }

    public func apply(_ environment: [String: String] = ProcessInfo.processInfo.environment) {
        for context in ConfigurationDecoder.configurationContext(for: environment) {
            var isExecuted = false
            for item in map {
                let typeA = "\(item.0)"
                let typeB = context.type

                guard typeA == typeB else { continue }

                do {
                    let configuration = try item.0.decode(context.data)
                    let worker = item.1.init()
                    try worker.execute(configuration)
                    isExecuted = true
                } catch ConfigurationWorkerError.invalidConfiguration {
                    fatalError("Configuration is invalid")
                } catch {
                    fatalError("Configuration cannot be decoded")
                }
            }
            guard isExecuted else { fatalError("Configuration \(context.type) missing mapping to worker") }
        }
    }
}

private extension Configuration {
    static func decode(_ data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
