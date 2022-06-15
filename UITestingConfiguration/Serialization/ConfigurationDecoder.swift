import Foundation

final class ConfigurationDecoder {

    static func configurationContext(for environment: [String: String]) -> [(type: String, data: Data)] {
        var intermediateResult: [(type: String, data: Data, index: Int)] = []
        for (key, value) in environment {
            if key.hasPrefix(Constant.configurationPrefix), let data = Data(base64Encoded: value) {
                let parts = key.components(separatedBy: Constant.separator)
                assert(parts.count == 3, "Configuration key is corrupted")
                let indexString = parts[1]
                if let index = Int(indexString) {
                    let type = String(key.dropFirst(Constant.configurationPrefix.count + indexString.count + 2 * Constant.separator.count))
                    let item = (type, data, index)
                    intermediateResult.append(item)
                }
            }
        }
        intermediateResult.sort { $0.index < $1.index }
        return intermediateResult.map { input -> (type: String, data: Data) in
            return (input.type, input.data)
        }
    }
}
