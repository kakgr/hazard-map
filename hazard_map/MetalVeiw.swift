import SwiftUI
import MetalKit

struct MetalView: NSViewRepresentable {

    class Coordinator {
        var renderer: Renderer?
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeNSView(context: Context) -> MTKView {
        let view = MTKView(frame: .zero, device: MTLCreateSystemDefaultDevice())
        view.colorPixelFormat = .bgra8Unorm
        view.isPaused = false
        view.enableSetNeedsDisplay = false

        let renderer = Renderer(view: view)
        context.coordinator.renderer = renderer
        view.delegate = renderer

        return view
    }

    func updateNSView(_ nsView: MTKView, context: Context) {}
}
