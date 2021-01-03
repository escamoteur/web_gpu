#include <dawn/dawn_proc.h>
#include <dawn_native/DawnNative.h>

#define WEB_GPU_EXPORT __attribute__((visibility("default")))

extern "C" {
WEB_GPU_EXPORT void initWebGpu();
}

void initWebGpu() { dawnProcSetProcs(&dawn_native::GetProcs()); }
