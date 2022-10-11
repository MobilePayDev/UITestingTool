public final class KIFDependencies {
    static var configuration: KIFDependenciesConfiguration!
}

public struct KIFDependenciesConfiguration {
    public let viewTestActor: KIFUIViewTestActorInterface.Type
    public let viewExtension: KIFUIViewExtensionInterface.Type
}
