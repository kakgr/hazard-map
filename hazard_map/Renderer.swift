import MetalKit

class Renderer: NSObject, MTKViewDelegate {

    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!

    init(view: MTKView) {
        self.device = view.device
        self.commandQueue = device.makeCommandQueue()
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }

    func draw(in view: MTKView) {

        guard let drawable = view.currentDrawable,
              let passDescriptor = view.currentRenderPassDescriptor else { return }

        passDescriptor.colorAttachments[0].clearColor =
            MTLClearColorMake(1, 0, 0, 1)

        let commandBuffer = commandQueue.makeCommandBuffer()!

        let encoder = commandBuffer.makeRenderCommandEncoder(
            descriptor: passDescriptor)!

        encoder.endEncoding()

        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
