public final class KIFDependencies {
    public static var configuration: KIFDependenciesConfiguration!
}

public struct KIFDependenciesConfiguration {
    public let viewTestActor: KIFUIViewTestActorInterface.Type
    public let viewExtension: KIFUIViewExtensionInterface.Type
    
    public init(viewTestActor: KIFUIViewTestActorInterface.Type, viewExtension: KIFUIViewExtensionInterface.Type) {
        self.viewTestActor = viewTestActor
        self.viewExtension = viewExtension
    }
}
