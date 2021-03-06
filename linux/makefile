SRC_DIR=$(shell pwd)
INSTALL_DIR=$(HOME)

DIRS=\
	$(INSTALL_DIR)/.config/sublime-text-3/Packages/User/

BASH_ENV=bashrc.sh\
	bash_aliases.sh\
	bash_utils.sh

all: direcotires bash scripts sublimeconfig
	@echo "[Installed all in : $(INSTALL_DIR)]"

directories: $(DIRS)

$(DIRS):
	mkdir  -p $(DIRS)

%.sh:
	cp $(SRC_DIR)/bash/$@ $(INSTALL_DIR)/.$(@:.sh=)

bash: $(BASH_ENV)
	@echo "[Configures bash environment]"

sublimeconfig:
	cp $(SRC_DIR)/sublime/settings/Default\ \(Linux\).sublime-keymap $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
	cp $(SRC_DIR)/sublime/settings/Preferences.sublime-settings $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
	cp $(SRC_DIR)/sublime/settings/custom_make.sublime-build $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/custom_make.sublime-build
	cp $(SRC_DIR)/sublime/settings/JSON.sublime-settings $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/JSON.sublime-settings
	cp $(SRC_DIR)/sublime/latex/section.sublime-snippet $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/section.sublime-snippet
	cp $(SRC_DIR)/sublime/latex/subsection.sublime-snippet $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/subsection.sublime-snippet
	cp $(SRC_DIR)/sublime/latex/subsubsection.sublime-snippet $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/subsubsection.sublime-snippet
	cp $(SRC_DIR)/sublime/latex/space.sublime-snippet $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/space.sublime-snippet
	cp $(SRC_DIR)/sublime/latex/todo.sublime-snippet $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/todo.sublime-snippet
	cp $(SRC_DIR)/sublime/latex/subfig.sublime-snippet $(INSTALL_DIR)/.config/sublime-text-3/Packages/User/subfig.sublime-snippet

	@echo "[Configured Sublime]"

diff_files = colordiff $(INSTALL_DIR)/$1 $(SRC_DIR)/$2 || \
	echo -e "\e[0;31m$(INSTALL_DIR)/$1\e[0m and \e[34m$(SRC_DIR)/$2\e[0m differ"

%.diff:
	@$(call diff_files,.$(@:.diff=),bash/$(@:.diff=.sh))

diff: $(BASH_ENV:.sh=.diff)
	@$(call diff_files,.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap,sublime/Default\ \(Linux\).sublime-keymap)
	@$(call diff_files,.config/sublime-text-3/Packages/User/Preferences.sublime-settings,sublime/Preferences.sublime-settings)
	@$(call diff_files,.config/sublime-text-3/Packages/User/JSON.sublime-settings)
	@$(call diff_files,.config/sublime-text-3/Packages/User/custom_make.sublime-build)
	@$(call diff_files,.config/sublime-text-3/Packages/User/section.sublime-snippet)
	@$(call diff_files,.config/sublime-text-3/Packages/User/subsection.sublime-snippet)
	@$(call diff_files,.config/sublime-text-3/Packages/User/subsubsection.sublime-snippet)
	@$(call diff_files,.config/sublime-text-3/Packages/User/space.sublime-snippet)
	@$(call diff_files,.config/sublime-text-3/Packages/User/todo.sublime-snippet)
	@$(call diff_files,.config/sublime-text-3/Packages/User/subfig.sublime-snippet)
	@echo "[Files diffed]"
