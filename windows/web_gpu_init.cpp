#include <dawn/dawn_proc.h>
#include <dawn_native/DawnNative.h>

#include <memory>
#include <iostream>

using namespace std;

#define WEB_GPU_EXPORT __declspec(dllexport)

extern "C" {
WEB_GPU_EXPORT void initWebGpu();
}

void initWebGpu() { 
    auto instance = std::make_unique<dawn_native::Instance>();
    instance->DiscoverDefaultAdapters();

    std::vector<dawn_native::Adapter> adapters =  instance->GetAdapters();
//     for(int i = 0; i < adapters.size();i++)
// {
//     cout << i << " " << (int) adapters[i].GetBackendType(); 
// }
    dawnProcSetProcs(&dawn_native::GetProcs()); 
}
