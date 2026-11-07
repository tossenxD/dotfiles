(define-module (guix modules amdgpu)
  #:export amdgpu-packages
  #:export amdgpgpu-packages)

(define amdgpu-packages
  '(mesa
    amd-smi
    xf86-video-amdgpu))

(define amdgpgpu-packages
  '(mesa-utils
    mesa-opencl
    mesa-headers
    vulkan-tools
    vulkan-headers))
