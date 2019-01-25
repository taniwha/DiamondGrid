MODNAME		:= DiamondGrid
KSPDIR		:= ${HOME}/ksp/KSP_linux
MANAGED		:= ${KSPDIR}/KSP_Data/Managed
GAMEDATA	:= ${KSPDIR}/GameData
MODGAMEDATA := ${GAMEDATA}/${MODNAME}
PARTSDIR	:= ${MODGAMEDATA}/Parts
TEXDIR		:= ${MODGAMEDATA}/Textures

icon_FILES := \
	dgsize1_n.png \
	dgsize1_s.png \
	dgsize2_n.png \
	dgsize2_s.png

truss_CFG_FILES := \
	DGC-Adapter.cfg			\
	DGC-BalloonTank.cfg		\
	DGC-OctaHub.cfg			\
	DGC-Segment.cfg			\
	DGC-TetraHub.cfg		\
	DGC-TriAdapter.cfg		\
	DGT-Adapter.cfg			\
	DGT-NoLaunchClamp.cfg	\
	DGT-OctaHub.cfg			\
	DGT-QuadHub.cfg			\
	DGT-Segment.cfg			\
	DGT-TetraHub.cfg		\
	DGT-TriAdapter.cfg		\
	DGT-TriHub.cfg

truss_CFG_IN_FILES = $(patsubst %.cfg, %.cfg.in, ${truss_CFG_FILES})

truss_MU_FILES := \
	DGC-Adapter.mu			\
	DGC-BalloonTank.mu		\
	DGC-OctaHub.mu			\
	DGC-Segment.mu			\
	DGC-TetraHub.mu			\
	DGC-TriAdapter.mu		\
	DGT-Adapter.mu			\
	DGT-NoLaunchClamp.mu	\
	DGT-OctaHub.mu			\
	DGT-QuadHub.mu			\
	DGT-Segment.mu			\
	DGT-TetraHub.mu			\
	DGT-TriAdapter.mu		\
	DGT-TriHub.mu

truss_PNG_FILES := \
	CapsuleTank.png	\
	Container.png	\
	Container2.png	\
	Sphere.png		\
	Structural.png

truss_FILES := ${truss_CFG_FILES} ${truss_MU_FILES} ${truss_PNG_FILES}

DOC_FILES := \
	License.txt \
	README.md

all: ${truss_FILES} ${icon_FILES}

${truss_FILES}: truss.blend ${truss_CFG_IN_FILES}
	blender -noaudio --background truss.blend -P mass-export.py

dgsize1_n.png: dgsizeX.svg
	sed -e 's/X/1/' -e 's/\#000000/\#000000/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-png=$@ /dev/stdin

dgsize1_s.png: dgsizeX.svg
	sed -e 's/X/1/' -e 's/\#000000/\#ffffff/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-png=$@ /dev/stdin

dgsize2_n.png: dgsizeX.svg
	sed -e 's/X/2/' -e 's/\#000000/\#000000/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-png=$@ /dev/stdin

dgsize2_s.png: dgsizeX.svg
	sed -e 's/X/2/' -e 's/\#000000/\#ffffff/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-png=$@ /dev/stdin

.PHONY: version
version:
	@../tools/git-version.sh

info:
	@echo "${MODNAME} Build Information"
	@echo "    KSP GameData:   ${GAMEDATA}"

clean:
	rm -f ${truss_FILES} ${icon_FILES}

install: all
	mkdir -p ${PARTSDIR} ${TEXDIR}
	cp BulkheadProfiles.cfg ${MODGAMEDATA}
	cp ${icon_FILES} ${TEXDIR}
	cp ${truss_FILES} ${PARTSDIR}
	cp ${DOC_FILES} ${MODGAMEDATA}

.PHONY: all clean install
