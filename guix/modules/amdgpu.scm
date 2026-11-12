(define-module (modules amdgpu)
  #:export (amdgpu-environment
            amdgpgpu-environment))

;; amdgpu

(define amdgpu-packages
  '("mesa"
    "amd-smi"
    "xf86-video-amdgpu"))

(define amdgpu-services
  '())

(define amdgpu-environment
  (cons amdgpu-packages amdgpu-services))

;; amdgpgpu

(define amdgpgpu-packages
  '("mesa-utils"
    "mesa-opencl"
    "mesa-headers"
    "vulkan-tools"
    "vulkan-headers"))

(define amdgpgpu-services
  '())

(define amdgpgpu-environment
  (cons amdgpgpu-packages amdgpgpu-services))
