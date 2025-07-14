if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo $0"
  exit 1
fi

LLVM_VERSION=19


# install
wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh
./llvm.sh ${LLVM_VERSION}


# clang, clang++
update-alternatives \
    --install /usr/bin/clang    clang     /usr/bin/clang-${LLVM_VERSION} 100 \
    --slave   /usr/bin/clang++  clang++   /usr/bin/clang++-${LLVM_VERSION}

update-alternatives \
		--install /usr/bin/cc       cc        /usr/bin/clang 100
update-alternatives \
		--install /usr/bin/c++      c++       /usr/bin/clang++ 100

# bfd (gnu ld.bfd)
update-alternatives \
    --install /usr/bin/ld       ld        /usr/bin/ld.bfd 20

# lld
update-alternatives \
		--install /usr/bin/ld.lld   ld.lld    /usr/bin/ld.lld-${LLVM_VERSION} 100
update-alternatives \
		--install /usr/bin/ld       ld        /usr/bin/ld.lld 100

# lldb
update-alternatives \
		--install /usr/bin/lldb     lldb      /usr/bin/lldb-${LLVM_VERSION} 100