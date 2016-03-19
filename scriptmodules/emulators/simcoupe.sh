#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="simcoupe"
rp_module_desc="SimCoupe SAM Coupe emulator"
rp_module_menus="4+"
rp_module_flags=""

function depends_simcoupe() {
    getDepends cmake libsdl1.2-dev zlib1g-dev
}

function sources_simcoupe() {
    gitPullOrClone "$md_build" https://github.com/simonowen/simcoupe.git
}

function build_simcoupe() {
    cd "$md_build"/SDL
    make
}

function install_simcoupe() {
    md_ret_files=(
        'SDL/simcoupe'
        'Resource/atom.rom'
        'Resource/atomlite.rom'
        'Resource/samcoupe.rom'
        'Resource/SimCoupe.bmp'
        'Resource/samports.map'
        'Resource/samrom.map'
    )
}

function configure_simcoupe() {
    mkRomDir "samcoupe"
    moveConfigDir "$home/.simcoupe" "$configdir/$md_id/"

    addSystem 1 "$md_id" "samcoupe" "pushd $md_inst; $md_inst/simcoupe autoboot -disk1 %ROM% -fullscreen; popd" "SAM Coupe" ".dsk .mgt .sbt .sad .DSK .MGT .SBT .SAD"
}
