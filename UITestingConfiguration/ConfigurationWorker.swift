public enum ConfigurationWorkerError: Error {
    case invalidConfiguration
}

public protocol ConfigurationWorker {
    init()
    func execute(_ configuration: Configuration) throws
}
