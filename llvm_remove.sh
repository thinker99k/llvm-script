if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo $0"
  exit 1
fi

LLVM_VERSION=19


# clang, clang++
update-alternatives \
		--remove cc     /usr/bin/clang
update-alternatives \
		--remove c++    /usr/bin/clang++

update-alternatives \
		--remove clang  /usr/bin/clang-${LLVM_VERSION}

# lld
update-alternatives \
		--remove ld     /usr/bin/ld.lld
update-alternatives \
		--remove ld.lld /usr/bin/ld.lld-${LLVM_VERSION}

# lldb
update-alternatives \
		--remove lldb   /usr/bin/lldb-${LLVM_VERSION}


# remove
PKG="clang-${LLVM_VERSION} lldb-${LLVM_VERSION} lld-${LLVM_VERSION} clangd-${LLVM_VERSION}"
apt remove -y $PKG && apt autoremove -y