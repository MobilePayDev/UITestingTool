import Foundation

public final class ConfigurationEncoder {

    private var index: Int = 0

    public init() {}

    public func launchEnvironment<T: Configuration>(for configuration: T) -> (key: String, value: String)? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(configuration) else { return nil }
        let encodedConfiguration = data.base64EncodedString()
        let key = self.key(for: configuration)
        return (key, encodedConfiguration)
    }

    private func key<T: Encodable>(for configuration: T) -> String {
        index += 1
        return Constant.configurationPrefix + Constant.separator + "\(index)" + Constant.separator + "\(type(of: configuration))"
    }
}
