inherit relocatable

# SDK packages are built either explicitly by the user,
# or indirectly via dependency.  No need to be in 'world'.
EXCLUDE_FROM_WORLD = "1"

STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"

# we dont want libc-uclibc or libc-glibc to kick in for nativesdk recipes
LIBCOVERRIDE = ""
CLASSOVERRIDE = "class-nativesdk"

#
# Update PACKAGE_ARCH and PACKAGE_ARCHS
#
PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"

STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"

HOST_ARCH = "${SDK_ARCH}"
HOST_VENDOR = "${SDK_VENDOR}"
HOST_OS = "${SDK_OS}"
HOST_PREFIX = "${SDK_PREFIX}"
HOST_CC_ARCH = "${SDK_CC_ARCH}"
HOST_LD_ARCH = "${SDK_LD_ARCH}"
HOST_AS_ARCH = "${SDK_AS_ARCH}"
#HOST_SYS = "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"

TARGET_ARCH = "${SDK_ARCH}"
TARGET_VENDOR = "${SDK_VENDOR}"
TARGET_OS = "${SDK_OS}"
TARGET_PREFIX = "${SDK_PREFIX}"
TARGET_CC_ARCH = "${SDK_CC_ARCH}"
TARGET_LD_ARCH = "${SDK_LD_ARCH}"
TARGET_AS_ARCH = "${SDK_AS_ARCH}"
TARGET_FPU = ""

CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
CFLAGS = "${BUILDSDK_CFLAGS}"
CXXFLAGS = "${BUILDSDK_CFLAGS}"
LDFLAGS = "${BUILDSDK_LDFLAGS}"

# Change to place files in SDKPATH
base_prefix = "${SDKPATHNATIVE}"
prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
baselib = "lib"

export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"

PKGSUFFIX = "-nativesdk"

python nativesdk_virtclass_handler () {
    if not isinstance(e, bb.event.RecipePreFinalise):
        return

    pn = e.data.getVar("PN", True)
    if not pn.endswith("-nativesdk"):
        return

    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
}

python () {
    pn = d.getVar("PN", True)
    if not pn.endswith("-nativesdk"):
        return

    def map_dependencies(varname, d, suffix = ""):
        if suffix:
            varname = varname + "_" + suffix
        deps = d.getVar(varname, True)
        if not deps:
            return
        deps = bb.utils.explode_deps(deps)
        newdeps = []
        for dep in deps:
            if dep.endswith("-native") or dep.endswith("-cross"):
                newdeps.append(dep)
            elif dep.endswith("-gcc-intermediate") or dep.endswith("-gcc-initial") or dep.endswith("-gcc") or dep.endswith("-g++"):
                newdeps.append(dep + "-crosssdk")
            elif not dep.endswith("-nativesdk"):
                newdeps.append(dep.replace("-nativesdk", "") + "-nativesdk")
            else:
                newdeps.append(dep)
        d.setVar(varname, " ".join(newdeps))

    map_dependencies("DEPENDS", d)
    #for pkg in (d.getVar("PACKAGES", True).split() + [""]):
    #    map_dependencies("RDEPENDS", d, pkg)
    #    map_dependencies("RRECOMMENDS", d, pkg)
    #    map_dependencies("RSUGGESTS", d, pkg)
    #    map_dependencies("RPROVIDES", d, pkg)
    #    map_dependencies("RREPLACES", d, pkg)

    provides = d.getVar("PROVIDES", True)
    for prov in provides.split():
        if prov.find(pn) != -1:
            continue
        if not prov.endswith("-nativesdk"):
            provides = provides.replace(prov, prov + "-nativesdk")
    d.setVar("PROVIDES", provides)
}

addhandler nativesdk_virtclass_handler

do_populate_sysroot[stamp-extra-info] = ""
do_package[stamp-extra-info] = ""
