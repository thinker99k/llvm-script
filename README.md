# llvm-script

```shell
git clone https://github.com/thinker99k/llvm-script && \
cd llvm-script && chmod +x *.sh && sudo ./llvm_install.sh
```

### llvm_install.sh
- `apt install`
  - `clang-<version>`
  - `lldb-<version>`
  - `lld-<version>`
  - `clangd-<version>`

- `update-alternatives`
  - `clang-<version>` <- `clang` <- `cc`
  - `clang++-<version>` <- `clang++` <- `c++`
  - `ld.bfd` <- `ld` (for rollback)
  - `ld.lld-<version>` <- `ld.lld` <- `ld` (higher priority)
  - `lldb-<version>` <- `lldb`


### llvm_remove.sh

- `apt remove`
  - `clang-<version>`
  - `lldb-<version>`
  - `lld-<version>`
  - `clangd-<version>`

- `update-alternatives`
  - `gcc` <- `cc`
  - `g++` <- `c++`
  - `ld.bfd` <- `ld`
  - (`lldb` is completely removed, so there's no rollback)

---
**MANUAL INSTALLATION WILL RUIN YOUR SYSTEM**
