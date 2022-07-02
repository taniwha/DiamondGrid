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
	DGC-Adapter1875.cfg		\
	DGC-Adapter250.cfg		\
	DGC-Adapter250r.cfg		\
	DGC-Adapter375.cfg		\
	DGC-BalloonTank.cfg		\
	DGC-OctaHub.cfg			\
	DGC-Segment.cfg			\
	DGC-TetraHub.cfg		\
	DGC-TriAdapter.cfg		\
	DGE-SinterOven.cfg		\
	DGT-Adapter.cfg			\
	DGT-Adapter1875.cfg		\
	DGT-Adapter250.cfg		\
	DGT-Adapter250r.cfg		\
	DGT-Adapter375.cfg		\
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
	DGC-Adapter1875.mu		\
	DGC-Adapter250.mu		\
	DGC-Adapter250r.mu		\
	DGC-Adapter375.mu		\
	DGC-BalloonTank.mu		\
	DGC-OctaHub.mu			\
	DGC-Segment.mu			\
	DGC-TetraHub.mu			\
	DGC-TriAdapter.mu		\
	DGE-SinterOven.mu		\
	DGT-Adapter.mu			\
	DGT-Adapter1875.mu		\
	DGT-Adapter250.mu		\
	DGT-Adapter250r.mu		\
	DGT-Adapter375.mu		\
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
	Container-bump.png	\
	Container2.png	\
	Container2-bump.png	\
	Container3.png	\
	Container3-bump.png	\
	Sphere.png		\
	Structural.png

truss_FILES := ${truss_CFG_FILES} ${truss_MU_FILES} ${truss_PNG_FILES}

habunit_CFG_FILES := \
	DGH-Adapter-internal.cfg	\
	DGH-Adapter.cfg			\
	DGH-Adapter-125-internal.cfg	\
	DGH-Adapter-125.cfg			\
	DGH-Airlock-internal.cfg	\
	DGH-Airlock.cfg			\
	DGH-Crew-375-internal.cfg	\
	DGH-Crew-375.cfg			\
	DGH-Dock-internal.cfg	\
	DGH-Dock.cfg			\
	$e

habunit_CFG_IN_FILES = $(patsubst %.cfg, %.cfg.in, ${habunit_CFG_FILES})

habunit_MU_FILES := \
	Airlock-Internal.mu		\
	Cabin.mu				\
	Hatch.mu				\
	Hatch-Internal.mu		\
	Ladder.mu				\
	DGH-Adapter-internal.mu \
	DGH-Adapter.mu \
	DGH-Adapter-125-internal.mu \
	DGH-Adapter-125.mu \
	DGH-Airlock-internal.mu \
	DGH-Airlock.mu \
	DGH-Crew-375-internal.mu \
	DGH-Crew-375.mu \
	DGH-Dock-internal.mu \
	DGH-Dock.mu \
	$e

habunit_PNG_FILES := \
	Hab-Adapter-bump.png \
	Hab-Adapter-diffuse.png \
	Hab-Airlock-bump.png \
	Hab-Airlock-diffuse.png \
	Hab-375-internal.png \
	Hab-375-internal-bump.png \
	Hab-375-bump.png \
	Hab-375-diffuse.png \
	$e

habunit_FILES := ${habunit_CFG_FILES} ${habunit_MU_FILES} ${habunit_PNG_FILES}

DOC_FILES := \
	License.txt \
	README.md

all: ${truss_FILES} ${habunit_FILES} ${icon_FILES}

${truss_FILES}: truss.blend ${truss_CFG_IN_FILES}
	blender -noaudio --background truss.blend -P mass-export.py

${habunit_FILES}: habunit.blend ${habunit_CFG_IN_FILES}
	blender -noaudio --background habunit.blend -P mass-export.py

dgsize1_n.png: dgsizeX.svg
	sed -e 's/X/1/' -e 's/\#000000/\#000000/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-type=png -o $@ /dev/stdin

dgsize1_s.png: dgsizeX.svg
	sed -e 's/X/1/' -e 's/\#000000/\#ffffff/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-type=png -o $@ /dev/stdin

dgsize2_n.png: dgsizeX.svg
	sed -e 's/X/2/' -e 's/\#000000/\#000000/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-type=png -o $@ /dev/stdin

dgsize2_s.png: dgsizeX.svg
	sed -e 's/X/2/' -e 's/\#000000/\#ffffff/g' $^ | inkscape --export-width=32 --export-height=32 --export-background='#000000' --export-background-opacity=0 --export-type=png -o $@ /dev/stdin

.PHONY: version
version:
	@../tools/git-version.sh

info:
	@echo "${MODNAME} Build Information"
	@echo "    KSP GameData:   ${GAMEDATA}"

clean:
	rm -f ${truss_FILES} ${habunit_FILES} ${icon_FILES}

install: all
	mkdir -p ${PARTSDIR} ${TEXDIR}
	cp BulkheadProfiles.cfg ${MODGAMEDATA}
	cp ${icon_FILES} ${TEXDIR}
	cp ${truss_FILES} ${PARTSDIR}
	cp ${habunit_FILES} ${PARTSDIR}
	cp ${DOC_FILES} ${MODGAMEDATA}

.PHONY: all clean install
